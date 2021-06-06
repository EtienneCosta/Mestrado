#!usr/bin/python3

import re


value="""
Ele mesmo costumava dizer \nera simplesmente um egoísta: mas\nnunca, como agora na velhice, as \ngenerosidades do seu coração ti-\nnham sido tão profundas e largas.\n\nParte do seu rendimento ia-se-\n-lhe por entre os dedos, espar-\nsamente, numa caridade enterne-\ncida.
"""

print(value)

def fix_lines(text:str)->str:
    text=re.sub(r'\w+\n\w+','',text)

    return text

print(fix_lines(value))