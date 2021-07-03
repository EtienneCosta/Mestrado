#/usr/bin/pythoon3
from jjcli import *   ## re + getopt + fileinputs + sys + os + subprocess
import numpy as np
import json
#Disable VisibleDeprecationWarning
np.warnings.filterwarnings('ignore', category=np.VisibleDeprecationWarning)

c=clfilter(opt="a")
txt = qx("pdftotext ementa.pdf -") #Subprocess

# apagar até "Sopa"
# ...*Sopa   Come todas as ocorrências (Greedy)
# ...*?Sopa  Vai até a primeira ocorrência (Não Greedy)

txt = sub(r'(.|\n)*?Sopa', r'===Sopa',  txt,count=1)
txt = sub(r'\n1 (.|\n)*'  , r'===Fim',  txt)
txt = sub(r'\n(Acompanhamento [12]|Prato|Sopa)\n' , r' ===\1\n',txt)

lista = split (r'===',txt)


lista.pop()  ## Tira último "FIM"
lista.pop(0) ## Tira primeiro " " 

menugeral=[]

for g in lista:
    tit,*items= split(r'\n\n+',g)
    menugeral.append((tit,items))

menugeral  = (np.array_split(menugeral,2))

almoco = list(menugeral[0])
jantar = list(menugeral[1])
result = []
jsonfile = []

for day in range(5):
    i=0
    result.append(("Dia",f"{day+2}ªfeira"))
    result.append(("Tipo","Almoço"))
    i+=1 
    for tit,its in almoco:
        if (i<4):
            result.append((tit,its[day].strip().replace('\n',' ')))
            i+=1
        else:
            i=0
            result.append((tit,its[day].strip().replace('\n',' ')))
            jsonfile.append(dict(result))

for day in range(5):
    i=0
    result.append(("Dia",f"{day+2}ªfeira"))
    result.append(("Tipo","Jantar"))
    i+=1
    for tit,its in jantar:
        if(i<4):
            result.append((tit,its[day].strip().replace('\n',' ')))
            i+=1        
        else:
            result.append((tit,its[day].strip().replace('\n',' ')))
            i=0
            jsonfile.append(dict(result))

with open('ementa.json','w+') as jfile:
    json.dump(jsonfile,jfile,ensure_ascii=False,indent=4)

print("ementa.json gerado com sucesso ...")
