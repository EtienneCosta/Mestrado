module Parser where
import Data.List 
import Data.Char
import Cp
import List
import  Prelude hiding ((<*>),(<$>))



type Parser s r = [s] -> [(r,[s])]


{-

Symbol : Parser para reconhecer um símbolo . 

---- Aplicação ----

*Parser>    symbol 'a' "angola"
            [('a',"ngola")]
----           ----

-}

symbol :: Eq a => a ->  Parser a a
symbol _ [] = []
symbol x (h:t)  | h == x = [(h,t)]
                | otherwise = []


{-
satisfy : Parser básico com base na aplicação de um predicado no input.

---- Aplicação ----

*Parser>    satisfy isDigit "1Angola"
            [('1',"Angola")]

----           ----

-}

satisfy :: (s -> Bool) -> Parser s s 
satisfy p [] = []
satisfy p (h:t)  | p h = [(h,t)]
                 | otherwise = []


{-
Token : Reconhecedor de um conjunto de símbolos. 

---- Aplicação ----

*Parser>    token "etienne" "etienne costa"
            [("etienne"," costa")]

----           ----
-}

token :: Eq s => [s] -> Parser s [s]
token t [] = []
token t input | take size input == t = [(t,drop size input)]
              | otherwise = []
            where size = length t 


{-
Suceed : Para modular a produção vazia.

Nota: Devolve sempre como resultado o símbolo passado.

---- Aplicação ----

*Parser>    suceed 'a' "etienne"
            [('a',"etienne")]

----           ----

-}

suceed :: r -> Parser s r 
suceed r input = [(r,input)]


{-

(<|>) : Função para representar a alternativas de parsers.

S ->  while      Equivale  token "for" <|> token "while" 
    | for
    ;


Sendo o resultado da função infixa <|> 


---- Aplicação ----

*Parser>    pWhileFor =  token "for" <|> token "while" 
            pWhileFor "for(int i=0;i<N;i++)"
            [("for","(int i=0;i<N;i++)")]
----           ----


-}

(<|>) :: Parser s a -> Parser s a -> Parser s a 
(p <|> q) input = p input ++ q input


pWhileFor =  token "for" <|> token "while" 


{-

<*>: Parser que combina a aplicação sequencial de parsers.


Tem semelhança a programação em lógica , i.e 

((x,y),ys)

Sendo que x é o resultado da aplicação do primeiro parser e y do segundo, e ys o que sobra da aplicação
sequencial.


(x,xs) <- p input .... o par (x,xs) é o resultado da aplicação do parser p ao input.

(y,ys) <- q xs .... o par (y,ys) é o resultado da aplicação do segundo parser ao que sobra da aplicação do primeiro.


Aplicação desta função tem uma pequena particularidade visto que o seu resultado surge como um conjunto de
tuplo aninhados tornando mais complexa a sua utilização .

-}

{-
(<*>) :: Parser s a -> Parser s b -> Parser s (a,b)
(p <*> q) input = [ ((x,y),ys)
                  | (x,xs) <- p input
                  , (y,ys) <- q xs
                  ]

pSeq = symbol 'a' <*> symbol 'b' <*> symbol 'c'

-}


(<*>) :: Parser s (a -> b) -> Parser s a -> Parser s b 
(p <*> q ) input = [ (f v, ys)
                   | (f, xs ) <- p input
                   , (v, ys)  <- q xs 
                   ]

{-

<$> : Função para aplicar durante o parsing.


-}

(<$>) :: (a->r) -> Parser s a -> Parser s r 
(f <$> p) input = [ (f v,xs)
                  | (v,xs) <- p input
                  ]   



{-

Aplicação prática de um Parser.

Eis a gramática que reconhece um conjunto de espaços.

Spaces -> ' ' Spaces 
        | ' '
        ;
-}
 
spaces' =  (f <$> symbol ' ' )                       -- Corresponde a Produção Spaces -> ' '
      <|>  (g <$>  symbol ' ' <*> spaces')           -- Corresponde a Produção Spaces -> ' ' Spaces 
      where 
           f a   = return a                          -- inserção do espaço na lista
           g a b = cons(a,b)                               -- inserção do espaço na lista 
 


{-

Spaces -> ' ' Spaces 
        | 
        ;
-}

spaces2 =   suceed []                        -- Corresponde a Produção Spaces ->
      <|>   (f <$> symbol ' ' <*> spaces2 )  -- Corresponde a Produção Spaces -> ' ' Spaces            
      where 
           f a b = cons(a,b)                   
 
--                  Exercises 4 - 7 

oneOrMore :: Parser a b -> Parser a [b]
oneOrMore p = (f <$> p)
          <|> (g <$> p <*> oneOrMore p) 
            where
                f a  = return a
                g a b  = cons(a,b) 

zeroOrMore :: Parser a b -> Parser a [b]
zeroOrMore p =  suceed []
            <|> (f <$> p <*> zeroOrMore p )
            where 
                f a b = cons(a,b)

spaces_zeroOrMore = zeroOrMore $ symbol ' '

spaces = zeroOrMore
          (satisfy (\x -> x `elem` [' ','\t','\n']))


optional :: Parser s r -> r -> Parser s r 
optional p r = p <|>  suceed r 

enclosedBy :: Parser s a -> Parser s b -> Parser s c -> Parser s b 
enclosedBy s p e = sf <$> s <*> p <*> e
  where sf a b c = b
  
separatedBy :: Parser s a -> Parser s b -> Parser s [a]
separatedBy p s =  f <$>  p <*> s <*> (separatedBy p s)
               <|> (g <$>  p)
        where f a b c = cons(a,c)
              g a     = return a


followedBy  ::  Parser s a -> Parser s b -> Parser s [a]
followedBy  p s =  f <$>  p <*> s <*> (followedBy p s)
               <|> suceed []
            where f a b c = cons(a,c)                  


-- A parser for Regular Expressions .
-- the result of the parser will be an AST (Abstract Syntax Tree) define as :


data RegExp sy = Epsilon 
               | Literal sy 
               | Or (RegExp sy) (RegExp sy)
               | Then (RegExp sy) (RegExp sy)
               | Star (RegExp sy)
               | OneOrMore (RegExp sy)
               | Optional (RegExp sy)


-- Regular Expressions: non-felt recursive grammar

{-

Expr -> ExprThen '|' Expr 
      | ExprThen
      |

ExprThen -> Term ExprThen 
          | Term 

Term -> Factor '?' 
      | Factor '*'
      | Factor '+'
      | Factor

Factor -> <letterOrDig> 
        | <anyChar>
        | '(' Expr ')'

-}

expr :: Parser Char (RegExp Char)
expr =  (f <$> termThen <*> symbol '|' <*> expr )
    <|> (id  <$> termThen )
    <|> (suceed Epsilon   )
        where f l _ r = Or l r 

-- Creio que o id acrescentado não faça diferença.



termThen =   (f <$> term <*> termThen)
        <|>  (term )
    where f l r = Then l r 

term =     ( f <$> factor <*> symbol '?' )
    <|>    ( g <$> factor <*> symbol '*' )
    <|>    ( h <$> factor <*> symbol '+' )
    <|>    ( id <$> factor               )

    where f l _ = Optional l 
          g l _ = Star l
          h l _ = Then l (Star l)

factor =  (f <$> satisfy (\x -> isDigit x || isAlpha x )) -- Letter or Digit
      <|> (h <$> symbol '(' <*> expr <*> symbol ')' )
      where
          f a = Literal a 
          h _ e _ = e 
        
parserRegExp :: String -> -- Input symbols
                Maybe (RegExp Char) -- Regular Expression

parserRegExp = undefined
{-
parserRegExp re = res 
    where parsed_re = expr re 
        res | parsed_re == [] = Nothing 
            | otherwise = Just (fst (head parsed_re))
-}
