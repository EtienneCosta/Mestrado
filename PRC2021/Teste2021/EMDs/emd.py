#!/usr/bin/python3
# -*- coding: utf-8 -*-
#
# Author : Etienne Costa
# Email  : etienne_costa@hotmail.com

import json 



with open ('emd.json') as f:
    jsonfile = json.load(f)
    modalidades = set()
    clubes = set()
    atletas =[]
    exames = set()
    for e in jsonfile:
        atletas.append("""
###  http://www.di.uminho.pt/prc2021/EMDs#{nome}
:{nome} rdf:type owl:NamedIndividual ,
                           :Atleta ;
                  :pertence :{clube} ;
                  :pratica :{modalidade} ;
                  :realizou :{emd} ;
                  :federado "{federado}"^^xsd:boolean ;
                  :género "{género}" ;
                  :idade {idade} ;
                  :morada "{morada}" ;
                  :nome "{Nome}" .

""".format(nome=(e['nome']['primeiro']+'_'+e['nome']['último']).lower(),clube=e['clube'].replace(' ','_').lower(),modalidade=e['modalidade'].lower(),
                   emd=(e['dataEMD'].replace('-','_')+'_'+e['nome']['primeiro']+'_'+e['nome']['último']).lower(),federado=e['federado'],
                   género=e['género'],idade=e['idade'],morada=e['morada'],Nome=e['nome']['primeiro']+' '+e['nome']['último']
                    ))      

        clubes.add("""
###  http://www.di.uminho.pt/prc2021/EMDs#{id}
:{id} rdf:type owl:NamedIndividual ,
                                       :Clube ;
                              :email "{email}" ;
                              :nome "{clube}" .    
""".format(id=e['clube'].replace(' ','_').lower(),email=e['email'],clube=e['clube']))


        modalidades.add("""
###  http://www.di.uminho.pt/prc2021/EMDs#{id}
:{id} rdf:type owl:NamedIndividual ,
                  :Modalidade ;
         :nome "{modalidade}" .
   
""".format(id=e['modalidade'].lower(),modalidade=e['modalidade']))


        exames.add("""
###  http://www.di.uminho.pt/prc2021/EMDs#{id}
:{id} rdf:type owl:NamedIndividual ,
            :EMD ;
            :resultado "{resultado}"^^xsd:boolean ;
            :dataEMD "{data}" .
   
""".format(resultado=e['resultado'],id=(e['dataEMD'].replace('-','_')+'_'+e['nome']['primeiro']+'_'+e['nome']['último']).lower(),data=e['dataEMD']))

#for a in atletas:
#    print(a) 

#for m in modalidades:
#    print(m)

#for c in clubes:
#    print(c)

#for e in exames:
#    print(e)