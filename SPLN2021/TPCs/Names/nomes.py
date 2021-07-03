#!/usr/bin/python3
import re,sys 
import readline
from strategy import *
from jjcli import *

# Devolve uma lista de pares : [(nome,email)]
def load_names_and_emails(filename: str) -> [(str, str)]:
    with open(filename, 'r', encoding='utf-8') as f:
        result = []
        for linha in f:
            linha = linha.strip()
            if re.search(r'::', linha):
                nome,email = split(r'\s*::\s*', linha)
                result.append((nome,email))
        return result

# Gerador de possíveis emails para cada um dos funcionários do DI.
def gendict(file: str)->dict:
    with open(file,'r') as names:
        # Vai conter o nome da pessoa e o conjunto de  "Pedro Rangel Henriques" : [prh,pedro,rangel,henriques,...]
        d = dict()
        # Lista com o nome dos funcionários do DI
        persons = []
        for n in names: 
            persons.append(n.split('::')[0].strip())

        for p in persons:
            d[p]=genemails(p)
    return d

def avalia1(solucao: [(str,str)], calc,name_emails:dict) -> float:
    soma = 0
    for n,e in solucao:
        r = calc(e, name_emails)
        if n in r:
            i = r.index(n)
            a = 1/(i+1)
            soma += a
    return soma / len(solucao)

def search(code:str,name_email:dict)-> [str]:
    names = []
    for n,e in name_email.items():
        if e.count(code)>0:
            names.append(n)
    return names

def main():
    s = load_names_and_emails(sys.argv[1])
    name_emails = gendict(sys.argv[1])
    a = avalia1( s , search,name_emails)

    print('================ Taxa de Acerto ============')
    print('Taxa de Acerto :')
    print('               ',a*100,'%')
    print('============================================\n')

    print('================ HELP ======================')
    print('? jno')
    print('     José Nuno Fonseca de Oliveira  ::  100.0%')
    print()
    print('? etienne')
    print('         No results found for etienne  😢')
    print()
    print('? exit')
    print()
    print('============================================\n')
    
    while True:
      code = input("? ").strip()
    
      if code == "exit":
          sys.exit()
    
      else:
          readline.add_history(code)
          names=search(code,name_emails)
          if len(names)>0:
              print('============================================')
              for n in names:
                  print(n)
              print('============================================')
    
          else: 
              print('============================================')
              print('No results found for '+code + '  😢')
              print('============================================')
main()
