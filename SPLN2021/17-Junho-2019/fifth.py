#!usr/bin/python3

def calcAtributes(attrs:dict)->str:
    atributos=""
    for key,value in attrs.items():
        atributos+=f'{key}="{value}"'
    return atributos

def toXML(tag:str,attrs:dict,content):
    if isinstance(content,str):
        if len(attrs)>0 :
            atributos=calcAtributes(attrs)
            print(f'<{tag} {atributos}>{content}</{tag}>')
        else :
            print(f'<{tag}>{content}</{tag}>')

    elif isinstance(content,dict):
        if len(attrs)>0:
            atributos=calcAtributes(attrs)
            print(f'<{tag} {atributos}>')
            for key,value in content.items():
                print(f'<{key}>{value}</{key}>')
            print(f'</{tag}>')
        else:
            print(f'<{tag}>')
            for key,value in content.items():
                print(f'<{key}>{value}</{key}>')
            print(f'</{tag}>')
    elif isinstance(content,list):
        if len(attrs)>0:
            atributos=calcAtributes(attrs)
            for c in content:
                print(f'<{tag} {atributos}>{c}</{tag}>')
        else:
            for c in content:
                print(f'<{tag}>{c}</{tag}>')

    elif callable(content):
        if len(attrs)>0:
            atributos=calcAtributes(attrs)
            print(f'<{tag} {atributos}>{content(tag)}</{tag}>')
        else:
            print(f'<{tag}>{content(tag)}</{tag}>')
        

print("================== STRING ==============================")
toXML('frase',{'autor':'Camões'},'Alma minha que te partiste')
print("=======================================================")
print()
print("================== LISTA ==============================")
toXML('numero',{'lang':'pt'},['um','dois'])
print("=======================================================")
print()

print("================== DICIONÁRIO ==============================")
toXML('ementa',{},{'hoje':'badejo','amanha':'abrotea'})
print("=======================================================")
print()

print("================== FUNÇÃO ==============================")
toXML('café',{},lambda x: 'Vou tomar '+ x)
print("=======================================================")

