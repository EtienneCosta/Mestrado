grammar Faturas;


@header { 
import java.util.* ;
}


@members {


    public double sum(List<Double> array){
      double res=0;
      for(Double preco: array)
            res+=preco;
            return res;
      }

    public class Produto {

    private Integer ref;
    private String desc;
    private Double preco;
    private Integer quantidade;




    public Produto(Integer ref, String desc, Double preco, Integer quantidade) {
        this.ref = ref;
        this.desc = desc;
        this.preco = preco;
        this.quantidade = quantidade;
    }

    public Integer getRef() {
        return ref;
    }

    public String getDesc() {
        return desc;
    }

    public Double getPreco() {
        return preco;
    }

    public Integer getQuantidade() {
        return quantidade;
    }


    public void setRef(Integer ref) {
        this.ref = ref;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }


    @Override
    public String toString() {
        return "Produto{" +
                "ref=" + ref +
                ", desc='" + desc + '\'' +
                ", preco=" + preco +"€"+
                ", quantidade=" + quantidade +
                '}';
    }
}

}



faturas returns [ Map <Integer,Produto> productsOut = new HashMap<>()]   : produtos[$productsOut] {
    
                                                                            System.out.println ();
                                                                            System.out.println("----------- LISTA DE PRODUTOS EM STOCK --------------");
                                                                            System.out.println ();
                                                                                for (Produto p :$productsOut.values()){
                                                                            System.out.println("--------------------------------------------------------");
                                                                                    System.out.println(p.toString());
                                                                            System.out.println("--------------------------------------------------------");
                                                                                }

                                                                                                } fatura[$productsOut] + 
           ;

fatura [Map<Integer,Produto> productsIn] returns [List <Double> totalOut = new ArrayList<>()]  : header{
                                                  System.out.println ();
                                                  System.out.println("-------------------- FATURA "+ $header.idFaturaOut+" -----------------------");
                                                  } 
                                            body[$productsIn,$totalOut]+ {
                                                                System.out.println("TOTAL GASTO NA FATURA "+$header.idFaturaOut+": "+sum($totalOut)+" €");
                                                                System.out.println("-----------------------------------------------------");


System.out.println ();
                                                                            System.out.println("------ ACTUALIZAÇÃO DOS PRODUTOS EM STOCK -----------");
                                                                            System.out.println ();
                                                                                for (Produto p :$productsIn.values()){
                                                                            System.out.println("--------------------------------------------------------");
                                                                                    System.out.println(p.toString());
                                                                            System.out.println("--------------------------------------------------------");

                                                                                }





                                                               }
           ;

header returns [int idFaturaOut]    : numero fornecedor cliente { $idFaturaOut = $numero.numeroOut;}
           ;

fornecedor : nome nif morada nib
           ; 

cliente    : nome nif morada 
           ;

body [Map <Integer,Produto> productsIn,List <Double> totalIn] : ref quantidade {  int refProd = $ref.refOut;
                                                                                  int quantidadeC = $quantidade.quantidadeOut;


                                                            if($productsIn.containsKey(refProd)){

                                                                Produto p = $productsIn.get(refProd);


                                                                if(p.getQuantidade() - quantidadeC >=0){


                                                                    $totalIn.add(p.getPreco()*quantidadeC);


                                                                  
                                                                    System.out.println("-----------------------------------------------------");
                                                                    System.out.println("Descrição: "+p.getDesc() + "    Preço: "+p.getPreco()+" €");
                                                                    System.out.println("Referência do Produto: "+refProd + "    Quantidade: "+quantidadeC);
                                                                    System.out.println("Total Gasto : "+ p.getPreco()*quantidadeC);                                                                    
                                                                    System.out.println("-----------------------------------------------------");

                                                                    p.setQuantidade(p.getQuantidade() - quantidadeC);
                                                                    $productsIn.replace(refProd,p);







                                                                }

                                                                else {
                                                                        System.out.println("-----------------------------------------------------");                                    
                                                                        System.out.println("Impossível fazer esta aquisição:     ");
                                                                        System.out.println();
                                                                        System.out.println("Descrição: "+p.getDesc() + "    Preço: "+p.getPreco()+" €");
                                                                        System.out.println("Referência do Produto: "+refProd + "    Quantidade: "+quantidadeC);
                                                                        System.out.println("Quantidade em Stock : "+p.getQuantidade()+ "      Quantidade desejada: "+quantidadeC  );
                                                                        System.out.println("-----------------------------------------------------");

                                                                }




                                                            }

                                                            else {
                                                                System.out.println("-----------------------------------------------------");
                                                                System.out.println("Produto Inexistente: "+refProd);
                                                                System.out.println("-----------------------------------------------------");

                                                            }

                                                         }
           ;

produtos [ Map<Integer,Produto> productsIn]  : produto[$productsIn] +
                                      ;

produto [Map <Integer,Produto> productsIn]   : ref desc preco quantidade {     
                                                                        double price=Double.parseDouble($preco.text);  
                                                                        Produto p = new Produto($ref.refOut,$desc.text,price,$quantidade.quantidadeOut);
                                                                        $productsIn.put($ref.refOut,p);

                                                                        }
                                      ;



numero  returns [int numeroOut]   : NUMERO { $numeroOut = $NUMERO.int;}
           ;

nif        : NUMERO
           ;

nib        : NUMERO
           ;

nome       : PALAVRA
           ;

morada     : PALAVRA
           ;

ref returns [ int refOut ]        : NUMERO { $refOut = $NUMERO.int;}
           ;

quantidade returns [int quantidadeOut] : NUMERO { $quantidadeOut = $NUMERO.int;}
           ;

desc       : PALAVRA
           ;

preco      : NUMERO 
           ;





/* Analisador Léxico */

PALAVRA   : [A-Za-z]+
          ;



NUMERO    : [0-9]+('.'[0-9]+)?
          ;



WS : [\t\r\n ]+ -> skip 
   ;
