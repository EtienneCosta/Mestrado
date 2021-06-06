#!usr/bin/python3
import re

# Questão 5. 
"""
Suponha que dispomos de dois textos, t1 e t2, que são iguais mas com algumas
palavras escritas com grafia diferentes .

t1 = "As inundações provocaram graves damnos na pharmácia. [...]"
t2 = "As inundações provocaram graves danos na farmácia. [...]"

Implemente uma função find_corresp que receba essas duas strings e retorne um di-
cionário com as correspondências de grafia:

find_corresp(t1,t2)= {
    'damnos': 'danos',
    'pharmácia': 'farmácia'
}

Assuma que cada palavra em t1 corresponde a uma e uma só palavra em t2, e que todas as ocorrências
de qualquer palavra em t1 têm sempre a mesma palavra correspondente em t2.
"""

def find_corresp(text1:str,text2:str) -> dict:
    d = {}
    t1 = re.findall(r'\w+',text1)
    t2 = re.findall(r'\w+',text2)
    
    for index in range(len(t1)):
        if(t1[index]!=t2[index]):
            d[t1[index]]=t2[index]
    return d

t1 = "As inundações provocaram graves damnos na pharmácia. [...]"
t2 = "As inundações provocaram graves danos na farmácia. [...]"

print(find_corresp(t1,t2))