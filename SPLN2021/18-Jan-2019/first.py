#!usr/bin/python3

# Questão 1. Escreva da forma mais simples e elegante que conseguir:

"""
a) Uma função Python que, dada uma lista de números, dê o valor absoluto da maior diferença
entre dois elementos dessa lista :
"""
def max_diff(a:[int])->int:
    if len(a) > 0:
        a.sort()
        return  (a[-1] - a[0])  
    else :
        return "Empty Array"

"""
b) Uma função Python que, dada uma string, construa um dicionário que conta as ocorrências de 
cada carácter da string:
"""

def count_char_occur(text:str)->dict:
    result = {}
    for t in text:
        result[t]=0
    for t in text:
        result[t]+=1
    return result
