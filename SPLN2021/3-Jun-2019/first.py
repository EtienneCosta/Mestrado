#!usr/bin/python3

import unidecode
import re
from string import ascii_lowercase


# Questão 1. Escreva da forma mais simples e elegante que conseguir:

"""
(a) Uma função Python que, dada uma lista de números inteiros, 
retorna a soma do número de dígitos desses números:

count_digits([1, 5, 14, 28, 1000]) = 10
"""
def count_digits(numbers:[int])->int:
    digits=""
    for n in numbers:
        digits+=str(n)
    return len(digits)


"""
Uma função Python que, dada uma String, verifica se é um palíndromo ou expressão palíndroma:
“palavra, grupo de palavras ou verso em que o sentido é o mesmo, quer se leia da esquerda para
a direita quer da direita para a esquerda”.
Para este efeito, ignore os espaços, pontuação,capitalização e caracteres acentuados (pode usar a função unidecode do módulo unidecode 
que recebe uma String e a devolve sem acentuação).

is_palindrome("Olé! Maracujá, caju, caramelo.") # True
is_palindrome("Scripting em PLN")               # False
"""

def is_palindrome(text:str)->bool:
   text=unidecode.unidecode(text)
   text=text.lower()
   text = ''.join(t for t in text if t in ascii_lowercase)
   return text==text[::-1]


print(count_digits([1, 5, 14, 28, 1000]))
print(is_palindrome("Olé! Maracujá, caju, caramelo."))
print(is_palindrome("Scripting em PLN"))