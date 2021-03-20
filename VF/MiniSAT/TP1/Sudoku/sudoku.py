#!/usr/bin/python3
# -*- coding: utf-8 -*-
import sys 
import functools 

# python3 sudoku.py 2 sudoku2x2.txt 
"""
Recebe 2 ficheiros como input:
    -  N : Dimensão da matriz.
    -  Ficheiro : Com o estado inicial da matriz.
"""
if __name__ == '__main__':

    if len(sys.argv)==3:
        S = sys.argv[1]
        D = int(sys.argv[1]) # Dimensão da sub-matriz 
        N = D*D # Dimensão da matriz
        estado = sys.argv[2] # Ficheiro com o estado inicial da matriz
        nome = "sudoku"+S+"x"+S+".cnf"
    else : 
        print("python3 sudoku.py 'Dimensão do tabuleiro' 'Ficheiro Inicial'")
        sys.exit("Missing arguments ...")
    
    inicial = []
    clausulas = []
    intervalo = range(1,N+1)
    i = 1
    
    def cnf(linha,coluna,valor,flag):
        if flag:
           return str(functools.reduce(lambda sub, ele: sub * 10 + ele, (linha,coluna,valor)))
        else:
           return "-"+str(functools.reduce(lambda sub, ele: sub * 10 + ele,(linha,coluna,valor)))
    
    with open(estado,"r") as input :
        for linha in input.readlines():
            if len(linha.strip())==N :
                for c in range(0,N):
                    if  linha[c]!='.' and int(linha[c]) in intervalo :
                        inicial.append(cnf(i,c+1,int(linha[c]),True))
                       
    
            i+=1
    
    for l in intervalo: 
        for c in intervalo:
            # Cada célula tem pelo menos um valor.
            clausulas.append([cnf(l,c,v,True) for v in intervalo])
            # Cada célula tem no máximo um valor.
            for v in range(1, N+1):
                for w in range(v+1,N+1):
                    clausulas.append([cnf(l,c,v,False),cnf(l,c,w,False)])
    
    for v in intervalo:
        #Cada linha tem o valor v    
        for l in intervalo:
            clausulas.append([ cnf(l,c,v,True) for c in intervalo])
        #Cada coluna tem o valor v
            clausulas.append([ cnf(c,l,v,True) for c in intervalo])
        #Cada submatriz tem o valor v
        for sl in range(0,D):
            for sc in range(0,D):
                clausulas.append([cnf(sl*D+rd,sc*D+cd,v,True)
    	                          for rd in range(1,D+1) for cd in range(1,D+1)])
    
    with open(nome,"w+") as file:
        file.write("p cnf %d %d \n" % (N*N*N,len(clausulas)+len(inicial)))
        for clausula in clausulas:
            file.write(" ".join([l for l in clausula])+" 0 \n")
        #Estado inicial
        for estado in inicial:
            file.write(estado+" 0 \n")        