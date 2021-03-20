#!/usr/bin/python3
# -*- coding: utf-8 -*-
import sys 
import functools 
from z3 import *
if __name__ == '__main__':
    if len(sys.argv)==2:
        estado = sys.argv[1] # Ficheiro com o estado inicial do puzzle
        nome = "survo.smt"
    else : 
        print(" python3 survo.py 'Ficheiro Inicial' ")
        sys.exit("Missing arguments ...")
    s = z3.Solver()
    mapa = []
    columnValue = []    
    with open(estado,"r") as input :
        for linha in input.readlines():
                mapa.append(linha.strip().split())
    columnValue = mapa[-1]
    mapa.pop(-1)
    nrColunas = len(columnValue)
    nrLinhas  = len(mapa) 
  
    x = {}
    for l in range(1,nrLinhas+1):
        x[l]={}
        for c in range(1,nrColunas+1):
          x[l][c]=Int('x'+str(l)+str(c)) # Declaração de variáveis.
          s.add(And (1 <= x[l][c], x[l][c] <=nrLinhas*nrColunas )) # Restrições de valor.

    for l in range(1,nrLinhas+1):
        s.add(Distinct ([x[l][c] for c in range(1,nrColunas+1)])) # Restrições da linha.

    for c in range(1,nrColunas+1):
        s.add(Distinct ([x[l][c] for l in range(1,nrLinhas+1)])) # Restrições da coluna.

    for l in range(1,nrLinhas+1):
        s.add( Sum(([x[l][c] for c in range(1,nrColunas+1)])) == mapa[l-1][-1]) # Soma da linha igual a X

    for c in range(1,nrColunas+1):
        s.add( Sum(([x[l][c] for l in range(1,nrLinhas+1)])) == columnValue[c-1]) # Soma da coluna igual a Y

    # Estado inicial do mapa
    for l in range(0,nrLinhas):
        for c in range(0,nrColunas):
            if(mapa[l][c]!='.'):
                s.add(x[l+1][c+1]==mapa[l][c])

    with open("output.txt","w+") as file:
        if (s.check()==sat):
            m=s.model()
            for l in range(1,nrLinhas+1):
                file.write(str([m[x[l][c]].as_long() for c in range(1,nrColunas+1)] )+ "\n")    
            print("SOLUÇÃO GERADA COM SUCESSO 👏🏼 ")
        else:
            file.write("UNSAT")
            print("INFELIZMENTE O PUZZLE NÃO TEM SOLUÇÃO 😢")