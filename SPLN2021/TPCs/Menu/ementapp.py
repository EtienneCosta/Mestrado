#/usr/bin/python3
import jjcli  ## re + getopt + fileinputs + sys + os + subprocess
import numpy as np

#Disable VisibleDeprecationWarning
np.warnings.filterwarnings('ignore', category=np.VisibleDeprecationWarning)

c=clfilter(opt="a")

txt = qx("pdftotext ementa.pdf -") #Subprocess

# INPUT : Dia da semana {2f,3f,4f,5f,6f}
i = sys.argv[1]          

#Remove o f do input
i =int(i.replace('f',''))
days = []


if i in range(2,7):
    days.append(i-2)
else:
    days=range(5)

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

print("================ALMOÇO====================")
for day in days:
    print(f"\nDia: {day+2}ªfeira")
    for tit,its in almoco:
        print("   ",tit,":")
        print("      ",its[day].strip().replace('\n',' '))
print("==========================================")

print("================JANTAR====================")
for day in days:
    print(f"\nDia: {day+2}ªfeira")
    for tit,its in jantar:
        print("   ",tit,":")
        print("      ",its[day].strip().replace('\n',' '))
print("==========================================")

"""
re :
   str = sub(ER, SS,str)
   lista = split(ER, str)
   lista = findall(ER,str)
   m = search (ER,str)
"""
