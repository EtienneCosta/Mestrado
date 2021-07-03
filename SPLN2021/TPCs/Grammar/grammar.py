#!/usr/bin/python3
# -*- coding: utf-8 -*-
from random import choice,randint

g={ 's' :[ ['futebol'],
           ['!ditados.txt'],
           ['MFES:','!mfes.txt','#mecanografico']
         ],

  'futebol' : [ 
           ['Golo!!','!futebol.txt',',aos ','#tempo',' minutos.'],
	         ['!futebol.txt',',recebe','cartão','cartões','por','uma','entrada','faltas','.']
	         
	       ],

   'cartões' : [ 
          ['amarelo'],
          ['vermelho']
	      ],
   
   'faltas' : [
        ['perigosa'],
        ['gravíssima']
   ]

}

def mecanografico () : 
    return 'A'+str(randint(11111,99999))

def tempo() :
      return str(randint(1,90))

def gera(grammar:dict , simb: str) -> str :
    # If terminal Then retorna o simb.  
    if simb not in grammar:
        if simb.startswith('!'):
          filename = simb.split("!")[1]
          with open (filename) as file :
            if filename=="futebol.txt" :
              f=file.readlines()
              pretty = choice(f).split("-")
              return pretty[0]+'('+pretty[1].strip()+')' + ' '
            else:
              f=file.readlines()
              return (choice(f).strip() + ' ')

        elif simb.startswith('#'):
            x = simb.split('#')[1]
            if(x=="mecanografico"):
              return mecanografico()
            else :
              return tempo()
        else :
            return simb + ' '

    rhss = grammar[simb]
    rhs = choice(rhss)
    ret = ' '

    for si in rhs:
        ret+= gera(grammar,si)
    return ret 

print(gera(g,'s'))