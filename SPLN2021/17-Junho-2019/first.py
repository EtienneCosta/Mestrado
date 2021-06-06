import unidecode

def sum_next_is_10(lista:[int])->[int] :
    result=[]
    for indice in range(len(lista)-1):
        if(lista[indice]+lista[indice+1]==10):
            result.append(lista[indice])
    return result

print(sum_next_is_10([1,5,7,3,6,4,8,2,10,0,3]))
print(sum_next_is_10([]))
print("=========================================================================")

def is_pangram(frase:str,alfabeto:str)-> bool:
    frase =unidecode.unidecode(frase)
    frase=frase.lower()
    for a in alfabeto:
        if a not in frase:
            return False
    return True

frase1="Blitz prende ex-vesgo com cheque fajuto."
frase2="Jui faz com que wiskhy de malte baixe logo preço de venda."
frase3="432109876533312315"
frase4="UMinho"

print(is_pangram(frase1,"abcdefghijlmnopqrstuvxz"))
print(is_pangram(frase2,"abcdefghijklmnopqrstuvwxyz"))
print(is_pangram(frase3,"0123456789"))
print(is_pangram(frase4,"UM Gualtar"))
print("=========================================================================")
