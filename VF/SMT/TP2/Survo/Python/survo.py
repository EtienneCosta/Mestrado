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
        print("python3 survo.py 'Ficheiro Inicial'")
        sys.exit("Missing arguments ...")
    s = z3.Solver()
    mapa = []
    clausulas = []
    columnValue = []    
    with open(estado,"r") as input :
        for linha in input.readlines():
                mapa.append(linha.strip().split())

    columnValue = mapa[-1]
    mapa.pop(-1)
    nrColunas = len(columnValue)
    nrLinhas  = len(mapa) 
    print(mapa)
    print(columnValue)
    #Número de variáveis : Linha x Coluna 
    
    # Depois basta aplicar o refactoring ao código para minimizar o número de iterações.
    for l in range(1,nrLinhas+1):
        for c in range(1,nrColunas+1):
            # Declaração das funções constantes
            clausulas.append("(declare-fun x"+str(l)+str(c)+" () Int)")

    for l in range(1,nrLinhas+1):
        for c in range(1,nrColunas+1):
            # Limite das constantes: Todas as constantes estão compreendidas num certo intervalo.
            clausulas.append("(assert (and (<= 1 x"+str(l)+str(c)+" ) (<= x"+str(l)+str(c)+" "+str(nrLinhas*nrColunas)+")))")
    
    for l in range(1,nrLinhas+1):
        lineRules = []
        lr="(assert (distinct "
        for c in range(1,nrColunas+1):
             # Regra para as linhas: Todos os valores são distintos.
            lineRules.append(" x"+str(l)+str(c))
        for lineRule in lineRules:
            lr+=lineRule
        lr+=" ) )"
        clausulas.append(lr)

    for c in range(1,nrColunas+1):
        colunmRules = []
        cr="(assert (distinct "
        for l in range(1,nrLinhas+1):
             # Regra para as colunas: Todos os valores são distintos.
            colunmRules.append(" x"+str(l)+str(c))
        for colunmRule in colunmRules:
            cr+=colunmRule
        cr+=" ) )"
        clausulas.append(cr)
    
    for c in range(1,nrColunas+1):
        colunmRules = []
        cr="(assert (= (+ "
        for l in range(1,nrLinhas+1):
             # Regra para as colunas: Todos os valores são distintos.
            colunmRules.append(" x"+str(l)+str(c))
        for colunmRule in colunmRules:
            cr+=colunmRule
        cr+=" ) "+columnValue[c-1]+" ) )"
        clausulas.append(cr)
    
    
    for l in range(1,nrLinhas+1):
        lineRules = []
        lr="(assert (= (+ "
        for c in range(1,nrColunas+1):
             # Regra para as linhas: A soma de todos os valores é igual a Y.
            lineRules.append(" x"+str(l)+str(c))
        for lineRule in lineRules:
            lr+=lineRule
        lr+=" ) "+mapa[l-1][-1]+" ) )"
        clausulas.append(lr)
    
    with open(nome,"w+") as file:
        #file.write("(set-logic QF_LIA)\n")
        for clausula in clausulas:
            file.write("".join([l for l in clausula])+"  \n")
        #Estado inicial
        for l in range(0,nrLinhas):
            for c in range(0,nrColunas):
                if mapa[l][c]!='.' :
                    file.write("(assert (=  x"+str(l+1)+str(c+1)+"  "+str(mapa[l][c])+ "))\n")

        file.write("(check-sat)\n")
        file.write("(get-model)\n")