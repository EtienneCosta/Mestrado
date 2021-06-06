#!usr/bin/python3
import re

def flatten(lista:list)->list:
    result=[]
    for l in lista:
        if isinstance(l,list):
            temp=flatten(l)
            result.extend(temp)
        else :
            result.append(l)

    return result 

lista = [1,[],[range(2,5)],[[["VI"]],["sete"]]]
print(flatten(lista))

#Estou a assumir que as listas têm o mesmo tamanho ... 
def f(l1:list,l2:list)->list:
    result=[]
    for i in range(len(l1)):
        result.append((l1[i],l2[i],l1[i]+l2[i]))

    return result

print(f([1,3,5],[3,4,5]))


def count_char_occur(text:str)->dict:
    result={}
    temp=[]
    for t in range(len(text)-1):
        temp.append(text[t]+text[t+1])
    
    for t in temp:
        result[t]=len(re.findall(f'{t}',text))

        
    return result 




print(count_char_occur('TESTE DE SPLN'))
