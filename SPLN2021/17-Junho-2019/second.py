#!usr/bin/python3
import re 
import sys
def co_occurs():
    entidade=sys.argv[1]
    ficheiro=sys.argv[2]
    count=1
    with open (ficheiro) as file:
        texto=file.read()
    frases=re.split(r'[.?!]+',texto)
    for frase in frases:
        if(frase.find(f'{entidade}')!=-1):
            temp=re.findall(r'{\w+}',frase)
            print(temp)
            for t in temp:
                t=t.replace('{','').replace('}','')
                if(t!=entidade):
                    print(t,count)
        count+=1

co_occurs()