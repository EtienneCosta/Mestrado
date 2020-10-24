import Parser hiding (term,factor,exp)
import Data.Char
import List
import Cp 
import  Prelude hiding ((<*>),(<$>),exp)


{-

1 - Considere a seguinte gramática independente de contexto que define a linguagem de ex-
pressões aritméticas, onde a prioridade dos respetivos operadores está expressa nas próprias
produções da gramática:
 
exp -> term 
    |  term '+' exp 
    |  term '-' exp
    ;

term -> factor 
      | factor '*' term 
      | factor '/' term 
      ;

factor -> number  -- sequência de dígitos.
        | ident   -- sequência de letras maiúsculas e minúsculas.
        | '(' exp ')'
-}


data Exp = AddExp Exp Exp 
         | MulExp Exp Exp 
         | SubExp Exp Exp 
         | DivExp Exp Exp
         | GThen  Exp Exp 
         | LThen  Exp Exp 
         | OneExp Exp 
         | Var String 
         | Const Int 

-- Pretty printing 

instance Show Exp where 
    show = showExp 

showExp (AddExp e1 e2 ) = showExp e1 ++ "+" ++ showExp e2 
showExp (MulExp e1 e2 ) = showExp e1 ++ "*" ++ showExp e2
showExp (SubExp e1 e2 ) = showExp e1 ++ "-" ++ showExp e2 
showExp (DivExp e1 e2 ) = showExp e1 ++ "/" ++ showExp e2
showExp (GThen  e1 e2 ) = showExp e1 ++ ">" ++ showExp e2
showExp (LThen  e1 e2 ) = showExp e1 ++ "<" ++ showExp e2 
showExp (OneExp e     ) = "(" ++ showExp e ++ ")"
showExp (Const i      ) = show i 
showExp (Var   a      ) = a

-----------------------------------------------------------------------------------------------

-- 1.1 Define combinadores de parsing para expressar os símbolos terminais 'number' 
-- e 'ident' .


-- regex for  digits : [0-9]+ 

{-
Digits ->  number 
        |  number Digits
        ;
-}

-- exemplo de aplicação : 

-- R : (fst.head.number) "280394 Etienne Costa"
-- ps : caso exista a necessidade de converte o output para inteiro basta aplicar o read .
-- i.e (read it)::Int


----------------------------------------------------------------------------------------------------
number'  =  ( f <$> satisfy isDigit )
       <|> ( g <$> satisfy isDigit <*> number )
  where f a = return a
        g a b = cons(a,b)


--- Alternativa de escrita ---

number = oneOrMore(satisfy isDigit)

----------------------------------------------------------------------------------------------------

-- regex for ident : [A-Za-z]+

{-
Ident -> ident 
      |  ident Ident
      ;
-}

----------------------------------------------------------------------------------------------------
ident' =  (f <$> satisfy isAlpha)
      <|> (g <$> satisfy isAlpha <*> ident')
        where 
            f a   = return a 
            g a b = cons(a,b) 

--- Alternativa de escrita ---


ident =  oneOrMore (satisfy isAlpha)

-----------------------------------------------------------------------------------------------


-- 1.2 Utilizando o tipo de dados Exp defina a expressão aritmética
-- " e = (var+3)*5 " 

e:: Exp
e =  MulExp (OneExp (AddExp (Var "var")  (Const 3) )) (Const 5)

-----------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------


-- 1.3 Escreva o parser baseado em combinadores que reconhece a notação de expressões aritméticas 
-- produzida pela função pretty printing anterior e devolve a árvore de syntaxe abstrata com tipo Exp.

{-
                             ---  GRAMÁTICA INDEPENDENTE DE CONTEXTO ---

exp -> term 
    |  term '+' exp 
    |  term '-' exp
    ;

term -> factor 
      | factor '*' term 
      | factor '/' term 
      ;

factor -> number  -- sequência de dígitos.
        | ident   -- sequência de letras maiúsculas e minúsculas.
        | '(' exp ')'

-}

exp =  (id <$> term) 
   <|> ( f <$> term <*> symbol '+' <*> exp)
   <|> ( g <$> term <*> symbol '-' <*> exp)
        where 
            f a _ c = AddExp a c  
            g a _ c = SubExp a c 

term =  (id <$> factor)
    <|> (f <$> factor <*> symbol '*' <*> term)
    <|> (g <$> factor <*> symbol '/' <*> term)
    <|> (h <$> factor <*> symbol '<' <*> term)
    <|> (k <$> factor <*> symbol '>' <*> term)
        where
            f a _ c = MulExp a c 
            g a _ c = DivExp a c 
            h a _ c = LThen a c
            k a _ c = GThen a c 
factor =   (f <$> number)
       <|> (g <$> ident )
       <|> (h <$> symbol '(' <*> exp <*> symbol ')')
          where
            f a = Const (read a :: Int) 
            g a = Var a 
            h _ b _ = OneExp b 
    
pExp' :: Parser Char Exp
pExp'  = exp  

pExp :: String -> String
pExp re = (showExp.fst.last.exp) re 


-----------------------------------------------------------------------------------------------

-- 1.4  Considere a seguinte expressão aritmética: 
-- e1 = "2 * 4 - 34"

-- Verifique que o parser desenvolvido não processa este input. Atualize a gramática de modo
-- a considerar a existência de espaços a separar símbolos das expressões. Sugestão;: defina 
-- um parser spaces, que define a linguagem de zero,um ou mais espaços. Defina ainda um parser
-- symbol que processa o símbolo dado e depois consome (ignorando) eventuais espaços que apareçam
-- a seguir.



-- Depois de considerar os espaços.


exp' :: Parser Char Exp 
exp' =  (id <$> term) 
   <|> ( f <$> term' <*> spaces_zeroOrMore <*> symbol '+' <*> spaces_zeroOrMore <*> exp')
   <|> ( g <$> term' <*> spaces_zeroOrMore <*> symbol '-' <*> spaces_zeroOrMore <*> exp')
        where 
            f a _ _ _ b = AddExp a b  
            g a _ _ _ b = SubExp a b 

term' :: Parser Char Exp 
term' =  (id <$> factor)
     <|> (f <$> factor' <*> spaces_zeroOrMore <*> symbol '*' <*> spaces_zeroOrMore <*> term')
     <|> (g <$> factor' <*> spaces_zeroOrMore <*> symbol '/' <*> spaces_zeroOrMore <*> term')
     <|> (h <$> factor' <*> spaces_zeroOrMore <*> symbol '<' <*> spaces_zeroOrMore <*> term')
     <|> (k <$> factor' <*> spaces_zeroOrMore <*> symbol '>' <*> spaces_zeroOrMore <*> term')
        where
            f a _ _ _ b = MulExp a b 
            g a _ _ _ b = DivExp a b 
            h a _ _ _ b = LThen a b  
            k a _ _ _ b = GThen a b 

factor':: Parser Char Exp 
factor' =   (f <$> number <*> spaces_zeroOrMore  )
       <|>  (g <$> ident  <*> spaces_zeroOrMore  )
       <|>  (h <$> symbol '(' <*> exp <*> symbol ')')
          where
            f a _ = Const (read a :: Int) 
            g a _ = Var a 
            h _ b _ = OneExp b 




-----------------------------------------------------------------------------------------------


-- 1.5 Escreva o parser baseado em combinadores que reconhece a notação de expressões aritméticas 
-- produzida pela função pretty printing anterior e devolve a árvore de syntaxe abstrata com tipo Exp.

{-
    Definido na biblioteca Parser.hs 

zeroOrMore :: Parser a b -> Parser a [b]
zeroOrMore p =  (f <$> p <*> zeroOrMore p )
            <|> suceed []
            where f a b = cons(a,b) 

-}

-----------------------------------------------------------------------------------------------

-- 1.6 Defina o parser spaces em termos de zeroOrMore.

{-

Duas possíveis implementações :

-- versão simplificada : spaces_zeroOrMore = zeroOrMore $ symbol ' '


-- versão completa :    spaces = zeroOrMore
          (satisfy (\x -> x `elem` [' ','\t','\n']))


-}

-----------------------------------------------------------------------------------------------

-- 1.7 Defina (em Parser.hs) o parser oneOrMore em termos de zeroOrMore.
-- Sugestão : Recorde que a+ = aa* .


oneOrMore' p = f <$> p <*> (zeroOrMore p)  
        where
            f a b = cons(a,b) 

-----------------------------------------------------------------------------------------------
-- Considere que definiu a seguinte linguagem de programação que é constituída por uma 
-- sequência de statements e em que um statement pode ser um ciclo while,um condicional
-- if ou uma atribuição. Esta linguagem é definida pelo seguinte tipo de dados abstrato:

data Prog = Prog Stats 

data Stats = Stats [Stat]

data Stat = While Exp Stats
          | IfThenElse Exp Stats Stats 
          | Assign Id Exp 

type Id = String 

instance Show Prog where 
    show = showProg 

showProg (Prog sts) = showStats sts 


instance  Show Stats where 
    show = showStats
       
showStats (Stats l) = showStatsList l 
showStatsList [] = ""
showStatsList (st:[]) = showStat st 
showStatsList (st:sts) = showStat st ++ ";\n " ++ (showStatsList sts)

instance Show Stat where 
    show = showStat

showStat (Assign n e) = n ++ " = " ++ showExp e 
showStat (While e sts) = "while (" ++ showExp e ++ ")\n " ++ 
                              "{ " ++ showStats sts ++ "}"
showStat (IfThenElse e s1 s2) = "if (" ++ showExp e ++ ")\n"++
                                "{ "++ showStats s1 ++ "}\n"++
                                "else { "++ showStats s2 ++"}\n"



--1.8 Escreva o parser baseado em combinadores para esta linguagem cuja notação
-- é definida pela função showProg.

pProg:: Parser Char Prog
pProg = undefined


-----------------------------------------------------------------------------------------------