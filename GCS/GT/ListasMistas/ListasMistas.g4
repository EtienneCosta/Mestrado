grammar ListasMistas;


@members { 
      int numeros=0,size=0,soma=0,media=0,palavras=0;
      int max = Integer.MIN_VALUE;
      boolean start = false, stop = false;
}

/* 
Gramática 

a) Contar o comprimento da lista e a quantidade de números ✔️
b) Acrescente aos resultados anteriores a média de todos os números ✔️
c) Obrigar a q ue a quantidade de palavras seja igual à quantidade de números ✔️
d) Calcular o máximo dos números ✔️
e) Calcular o somatório dos números contidos entre 'start' e 'stop' ✔️


*/

listas : lista+     
       ;

lista : LISTA exps '.' { 

                  
                  System.out.println("--------------------------------------------------------");
                  System.out.println("Comprimento da lista: "+size);
                  System.out.println("Quantidade de números: "+numeros);

                  if(numeros!=0) {
                        if(stop!=true)
                              soma=0;
                  System.out.println("Máximo dos números: "+max);
                  System.out.println("Somatório dos números: "+soma);
                  System.out.println("Média: "+media/(double)numeros);
                              
                              }

                  if(numeros==palavras)
                        System.out.println("Quantidade de palavras ("+palavras+") == Quantidade de números ("+numeros+")");

                  else 
                        System.out.println("Quantidade de palavras ("+palavras+") =/= Quantidade de números ("+numeros+")");


                  System.out.println();
                  numeros=0;  media=0; size=0; soma = 0 ;  palavras = 0;
                  max= Integer.MIN_VALUE;
                  start = false; stop = false;
                 

                }     
      ;



exps  : exp {size++;} (',' exp {size++;} )*
      ;


exp  : PALAVRA  { if($PALAVRA.text.equals("start")) 
                        start = true;

                   if($PALAVRA.text.equals("stop")&& start==true) {
                        stop = true;
                        start=false;
                   }

                  palavras++;
                }

     | NUMERO {    numeros++; 
                   media+=$NUMERO.int;
 
                  if(start==true)
                        soma+=$NUMERO.int;
            

                  if($NUMERO.int > max)
                        max=$NUMERO.int;

              }
             
     ;


/* Analisador Léxico */

LISTA:[Ll][Ii][Ss][Tt][Aa];

PALAVRA:[a-zA-Z][a-zA-Z0-9]*;

NUMERO:[0-9]+;

WS : [\t\r\n ]+ -> skip ;
