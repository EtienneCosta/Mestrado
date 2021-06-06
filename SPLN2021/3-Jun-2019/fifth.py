#!usr/bin/python3

import random 

"""

Pretende-se construir um sistema parar gerar respostas a partir de uma estrutura Python de acordo com os seguintes casos:

g("frase") = frase 

g([f1,f2,...fn]) : sorteia um dos elementos e gera-o

g((p1,p2, ... pn)) : concatena as partes 

g( lambda a: g(a)) : invoca passando Estado como parâmetro

Estado = {"nome":"Joaquim"}

g(
    (
        [  
             
            ("meu caro", ["amigo,",lambda x: x["nome"] ] ) , "querido interlocutor" 
        ],
        
        [ "cala-te que já lá vai o tempo em que os animais falavam.",
          "estou profundamente abismado com o que me dizes."
        ],
    )
               
 )

Implemente a função g(S). 
Pode tirar partido da função isinstance(var, class)
que permite verificar se o primeiro argumento é instância do segundo, 
e da função callable(obj) que permite determinar se o argumento é invocável.

"""
estado ={}
estado['nome']='etienne costa '
def g(polymorphic) :
    word=''

    if  isinstance(polymorphic,str):
        word+=polymorphic
    
    elif isinstance(polymorphic,list):
        value=random.choice(polymorphic)
        word+=g(value)

    elif isinstance(polymorphic,tuple):
        
        for p in polymorphic:
            word+=g(p)

    elif callable(polymorphic):
        word+=polymorphic(estado)

    return word


print(g(
    (
        [  
             
            ("meu caro ", ["amigo, ",lambda x: x["nome"] ] ) , "querido interlocutor " 
        ],
        
        [ "cala-te que já lá vai o tempo em que os animais falavam.",
          "estou profundamente abismado com o que me dizes."
        ],
    )
               
 ))