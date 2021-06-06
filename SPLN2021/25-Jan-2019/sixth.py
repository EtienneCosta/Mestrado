#!usr/bin/python3

import re

dict_pt_en={}


"""

Pretende-se implementar um gerador de chat bots. Neste gerador, um bot é uma função que recebe
uma lista de tuplos, em que cada tuplo é composto por um padrão (expressão regular) e uma lista 
de acções (identificadores de funções, funções lambda ou constantes), às quais são passados os grupos 
de captura das expressões regulares:


accoes = [
    (r'és um (\w+)', [
        lambda x: return f'{x} és tu!,
        lambda x: return f'Tu é que és {x}',
        'Quem o diz é quem o é cala a boca jacaré!'
    ]),
    (r'.',['Não percebi, fala direito!'])
]

"""


"""
a) Implemente o padrão e a acção correspondentes ao primeiro exemplo de resposta do bot("Carro em inglês")

"""


def translate_or_create(sentence:str)->str :
    translated_word=''
    if 'em inglês é' in sentence :
        wordPT=sentence.split()[0].strip()
        wordEN=sentence.split()[-1].strip()
        dict_pt_en[wordPT]=wordEN
        translated_word='ok'


    elif 'em inglês' in sentence :
        word=sentence.split()[0].strip()
        if word in dict_pt_en.keys():
            translated_word=dict_pt_en[word]
        else:
            translated_word='não sei'
    
    return translated_word

print(translate_or_create('carro em inglês'))
print(translate_or_create('carro em inglês é car'))
print(translate_or_create('carro em inglês'))






