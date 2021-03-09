#!/usr/bin/env python
import json

with open('dataset.json') as ficheiro:
    data = json.load(ficheiro)
i =0

########################### Frequenta ######################################
frequenta="                    :frequenta"
for uc in data.get("ucs") :
    if(i<3):
     frequenta+="  :"+uc.get("code")+" ,            \n                              "
     i+=1
    else:
     frequenta+="  :"+uc.get("code")+" ;            \n\n"
     i=0
########################### éAlunoDe ######################################
eAlunoDe="                    :éAlunoDe "
for docente in data.get("docentes") :
    if(i<3):
     eAlunoDe+="  :"+docente.get("code")+" ,           \n                              "
     i+=1
    else:
     eAlunoDe+="  :"+docente.get("code")+" ;            \n\n"
     i=0

########################### Aluno ######################################
alunos = []
eProfessorDe="                    :éProfessorDe "
eFrequentadaPor="                    :éFrequentadaPor"
for aluno in data.get("alunos") :
    code = aluno.get("nome").get("primeiro").lower()+aluno.get("nome").get("último").lower()
    nome ="                    :nome        "+"\""+aluno.get("nome").get("primeiro")+" "+aluno.get("nome").get("último")+"\"    ."
    alunos.append(":"+code+"     rdf:type    owl:NamedIndividual,\n"+"                             :Aluno ;\n\n"+frequenta+eAlunoDe+nome+"\n")
    if(i<199):
     eProfessorDe+="  :"+code+" ,           \n                                  "
     eFrequentadaPor+="      :"+code+" ,           \n                                    "
     i+=1
    else:
     eProfessorDe+="  :"+code+" ;            \n\n"
     eFrequentadaPor+="      :"+code+" ;            \n\n"
     i=0

    
########################### Professor ######################################
professores = []
codes = {}

for docente in data.get("docentes") :
    code = docente.get("code")
    codes[docente.get("ensina")]=docente.get("code")
    ensina ="                    :ensina         :"+ docente.get("ensina")+" ;\n\n"
    nome ="                    :nome        "+"\""+docente.get("nome").get("primeiro")+" "+docente.get("nome").get("último")+"\"    ."
    professores.append(":"+code+"     rdf:type    owl:NamedIndividual,\n"+"                             :Professor ;\n\n"+ensina+eProfessorDe+nome+"\n")

########################### UnidadeCurricular ######################################
ucs = []
for uc in data.get("ucs") :
    code = docente.get("code")
    ensina ="                    :éEnsinadaPor         :"+ codes[uc.get("code")]+" ;\n\n"
    designacao ="                    :designação        "+"\""+uc.get("designação")+"\"    ;\n"
    anoLectivo ="                    :anoLectivo        "+"\""+uc.get("anoLectivo")+"\"    .\n\n"

    ucs.append(":"+code+"     rdf:type    owl:NamedIndividual,\n"+"                    :UnidadeCurricular ;\n\n"+ensina+eFrequentadaPor+designacao+anoLectivo+"\n")


r="""
@prefix : <http://www.di.uminho.pt/prc2021/uc#> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix xml: <http://www.w3.org/XML/1998/namespace> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@base <http://www.di.uminho.pt/prc2021/uc> .

<http://www.di.uminho.pt/prc2021/uc> rdf:type owl:Ontology .

#################################################################
#    Object Properties
#################################################################

###  http://www.di.uminho.pt/prc2021/uc#ensina
:ensina rdf:type owl:ObjectProperty ;
        owl:inverseOf :éEnsinadaPor ;
        rdfs:domain :Professor ;
        rdfs:range :UnidadeCurricular .


###  http://www.di.uminho.pt/prc2021/uc#frequenta
:frequenta rdf:type owl:ObjectProperty ;
           owl:inverseOf :éFrequentadaPor ;
           rdfs:domain :Aluno ;
           rdfs:range :UnidadeCurricular .


###  http://www.di.uminho.pt/prc2021/uc#éAlunoDe
:éAlunoDe rdf:type owl:ObjectProperty ;
          owl:inverseOf :éProfessorDe .


###  http://www.di.uminho.pt/prc2021/uc#éEnsinadaPor
:éEnsinadaPor rdf:type owl:ObjectProperty .


###  http://www.di.uminho.pt/prc2021/uc#éFrequentadaPor
:éFrequentadaPor rdf:type owl:ObjectProperty .


###  http://www.di.uminho.pt/prc2021/uc#éProfessorDe
:éProfessorDe rdf:type owl:ObjectProperty ;
              owl:propertyChainAxiom ( :ensina
                                       :éFrequentadaPor
                                     ) .


#################################################################
#    Data properties
#################################################################

###  http://www.di.uminho.pt/prc2021/uc#anoLectivo
:anoLectivo rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/uc#designação
:designação rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/uc#nome
:nome rdf:type owl:DatatypeProperty .


#################################################################
#    Classes
#################################################################

###  http://www.di.uminho.pt/prc2021/uc#Aluno
:Aluno rdf:type owl:Class ;
       rdfs:subClassOf [ rdf:type owl:Restriction ;
                         owl:onProperty :frequenta ;
                         owl:someValuesFrom :UnidadeCurricular
                       ] .


###  http://www.di.uminho.pt/prc2021/uc#Professor
:Professor rdf:type owl:Class ;
           rdfs:subClassOf [ rdf:type owl:Restriction ;
                             owl:onProperty :ensina ;
                             owl:someValuesFrom :UnidadeCurricular
                           ] .


###  http://www.di.uminho.pt/prc2021/uc#UnidadeCurricular
:UnidadeCurricular rdf:type owl:Class .


#################################################################
#    Individuals
#################################################################
"""
with open('uc.ttl','w') as ttl:
    ttl.write(r)
    for a in alunos:
        ttl.write(a)
    for p in professores:
        ttl.write(p)
    for u in ucs:
        ttl.write(u)

print("Ontologia cria com sucesso ....")