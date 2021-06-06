#!usr/bin/python3

import re

txt="""
Angola, oficialmente República de Angola, é um país da costa ocidental da África, cujo território principal é limitado a norte e a nordeste pela República Democrática do Congo, a leste pela Zâmbia, a sul pela Namíbia e a oeste pelo Oceano Atlântico. 
Inclui também o exclave de Cabinda, através do qual faz fronteira com a República do Congo, a norte. 
Para além dos vizinhos já mencionados, Angola é o país mais próximo da colónia britânica de Santa Helena. 
"""

def polaridade_calc(pol:dict,text:str)->dict:
    frases=(re.split(r'[\.!?]',txt))
    result={}
    for f in frases :
        value=0
        palavras=f.split()
        for p in palavras:
            value+=pol[p]
        
        result[f]=value
    
    return result 