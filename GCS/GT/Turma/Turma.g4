grammar Turma;


@header { 
import java.util.* ;
}


@members { 
     List <Integer> notas = new ArrayList<>();
     Map <String,List<Integer>> alunos = new HashMap<>();
}


/* Gramática 

a) contar o total de alunos ✔️
b) calcular a nota média de cada aluno 
c) garantir que todos os alunos têm entre 4 e 6 notas e que estas estão na escala '0' a '20'
d) garantir que não há nomes repetidos 

*/

turmas : turma+ {           int sum ;
                            double media ;
                            System.out.println("Número Total de Alunos: "+alunos.size());
                            System.out.println();

                            for(String nome:alunos.keySet()){
                                System.out.println("Aluno: " +nome);
                                sum=0;
                                media =0.0;
                                List <Integer> grades = alunos.get(nome);



                                for(Integer grade:grades){
                                    System.out.println("  Nota:     "+grade);
                                    sum+=grade;

                                }
                                    media = sum/(double)grades.size();
                                    System.out.println(" Média:     "+media);
                                    System.out.println();

                             }
              }
       ;

turma : TURMA PALAVRA
      | aluno+
      ;

aluno : PALAVRA '('notas')' SYMBOL  {      
                                          String nome = $PALAVRA.text;
                                          alunos.put(nome,notas);
                                          notas = new ArrayList<>();
                                          
                                   }
      ;

notas : nota {  notas.add(Integer.parseInt($nota.text)); } (',' notas)*  

      ;

nota : NOTA { int nota =Integer.parseInt($NOTA.text); 

            }
     ;


/* Analisador Léxico */

TURMA : [Tt][Uu][Rr][Mm][Aa] 
      ;

PALAVRA : [A-Za-z]+
        ;

NOTA : ('0'|'20'|[1-9]|'1'[0-9])
     ;

SYMBOL : [.;]
       ;


WS : [\t\r\n ]+ -> skip 
   ;