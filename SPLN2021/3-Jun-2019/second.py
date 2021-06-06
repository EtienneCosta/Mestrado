#!usr/bin/python3

import unidecode
import re
from string import ascii_lowercase

# Questão 2. 
"""
Implemente em Python um filtro UNIX que receba um texto etiquetado em formato palavra/tag e imprima, 
para cada palavra do texto, a palavra e o número total de ocorrências, 
a(s) tag(s) correspondente(s) e o número de vezes que a palavra foi etiquetada com cada tag.

$ cat text.txt
"Eu/PROPESS nunca/ADV almoço/V à/PREP+ART hora/N do/KS almoço/N ./."

$ words_tags text.txt

almoço (2):  V (1), N (1)
Eu (1):  PROPESS (1)
nunca (1):  ADV (1)
à (1):  PREP+ART (1)
hora (1):  N (1)
do (1):  KS (1)
.  (1):  .  (1)
"""

def words_tags (text:str):
    dict={}
    words_tags=re.findall(r'[^ ]+',text)
    for wt in words_tags:
        palavra,tag=wt.split('/')
        if palavra not in dict.keys():
            dict[palavra]=[tag]
        else:
            dict[palavra].append(tag)
    for key,value in dict.items():
        tags=''
        size=len(value)
        for  v in value:
            tags+= v+'('+str(value.count(v))+')  '
            value=list(filter(lambda a: a != v, value))
        print(key+'('+str(size)+'):  '+ tags+'\n')

words_tags("Eu/PROPESS nunca/ADV almoço/V à/PREP+ART hora/N do/KS almoço/N ./.")