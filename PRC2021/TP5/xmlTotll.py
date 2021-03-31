#!/usr/bin/python3
# -*- coding: utf-8 -*-
from jjcli import *
import xml.etree.ElementTree as ET 

#Autor : Etienne Costa 

# Ficheiro de entrada 
tree = ET.parse(sys.argv[1])
root = tree.getroot()

# Dicionário de Autores e Editores 
autores = {}
editores = {}

# Turtle Final 
f = open("publicacoes.ttl","w")

f.write("""@prefix : <http://www.di.uminho.pt/prc2021/publicacoes#> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix xml: <http://www.w3.org/XML/1998/namespace> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@base <http://www.di.uminho.pt/prc2021/publicacoes> .

<http://www.di.uminho.pt/prc2021/publicacoes> rdf:type owl:Ontology .

#################################################################
#    Object Properties
#################################################################

###  http://www.di.uminho.pt/prc2021/publicacoes#edited
:edited rdf:type owl:ObjectProperty ;
        owl:inverseOf :editedBy .


###  http://www.di.uminho.pt/prc2021/publicacoes#editedBy
:editedBy rdf:type owl:ObjectProperty ;
          rdfs:domain :Publication ;
          rdfs:range :Person .


###  http://www.di.uminho.pt/prc2021/publicacoes#wrote
:wrote rdf:type owl:ObjectProperty ;
       owl:inverseOf :wrotedBy ;
       rdfs:domain :Person ;
       rdfs:range :Publication .


###  http://www.di.uminho.pt/prc2021/publicacoes#wrotedBy
:wrotedBy rdf:type owl:ObjectProperty .


#################################################################
#    Data properties
#################################################################

###  http://www.di.uminho.pt/prc2021/publicacoes#address
:address rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#booktitle
:booktitle rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#chapter
:chapter rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#doi
:doi rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#editor
:editor rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#howpublished
:howpublished rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#isbn
:isbn rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#issn
:issn rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#journal
:journal rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#month
:month rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#name
:name rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#pages
:pages rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#publisher
:publisher rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#school
:school rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#title
:title rdf:type owl:DatatypeProperty .


###  http://www.di.uminho.pt/prc2021/publicacoes#year
:year rdf:type owl:DatatypeProperty .

###  http://www.di.uminho.pt/prc2021/publicacoes#pdf
:pdf rdf:type owl:DatatypeProperty .


#################################################################
#    Classes
#################################################################

###  http://www.di.uminho.pt/prc2021/publicacoes#Article
:Article rdf:type owl:Class ;
         rdfs:subClassOf :Publication .


###  http://www.di.uminho.pt/prc2021/publicacoes#Author
:Author rdf:type owl:Class ;
        owl:equivalentClass [ owl:intersectionOf ( :Person                          
                                                   [ rdf:type owl:Restriction ;
                                                     owl:onProperty :wrote ;
                                                     owl:someValuesFrom :Publication
                                                   ]
                                                 ) ;
                              rdf:type owl:Class
                            ] ;
        rdfs:subClassOf :Person .


###  http://www.di.uminho.pt/prc2021/publicacoes#Book
:Book rdf:type owl:Class ;
      rdfs:subClassOf :Publication .


###  http://www.di.uminho.pt/prc2021/publicacoes#Editor
:Editor rdf:type owl:Class ;
        owl:equivalentClass [ owl:intersectionOf ( :Person
                                                   [ rdf:type owl:Restriction ;
                                                     owl:onProperty :edited ;
                                                     owl:someValuesFrom :Publication
                                                   ]
                                                 ) ;
                              rdf:type owl:Class
                            ] ;
        rdfs:subClassOf :Person .


###  http://www.di.uminho.pt/prc2021/publicacoes#Inbook
:Inbook rdf:type owl:Class ;
        rdfs:subClassOf :Publication .


###  http://www.di.uminho.pt/prc2021/publicacoes#Inproceedings
:Inproceedings rdf:type owl:Class ;
               rdfs:subClassOf :Publication .


###  http://www.di.uminho.pt/prc2021/publicacoes#Mastherthesis
:Mastherthesis rdf:type owl:Class ;
               rdfs:subClassOf :Publication .


###  http://www.di.uminho.pt/prc2021/publicacoes#Misc
:Misc rdf:type owl:Class ;
      rdfs:subClassOf :Publication .


###  http://www.di.uminho.pt/prc2021/publicacoes#Person
:Person rdf:type owl:Class .


###  http://www.di.uminho.pt/prc2021/publicacoes#Phdthesis
:Phdthesis rdf:type owl:Class ;
           rdfs:subClassOf :Publication .


###  http://www.di.uminho.pt/prc2021/publicacoes#Proceedings
:Proceedings rdf:type owl:Class ;
             rdfs:subClassOf :Publication .


###  http://www.di.uminho.pt/prc2021/publicacoes#Publication
:Publication rdf:type owl:Class .
""")

f.write('#################################################################\n')
f.write('#    Individuals\n')
f.write('#################################################################\n\n')
for child in root :
    wrotedBy='     :wrotedBy '
    editedBy='     :editedBy '
    properties=''
    
    f.write('###  http://www.di.uminho.pt/prc2021/publicacoes#'+child.attrib["id"]+'\n')
    f.write(':'+child.attrib["id"]  +'    rdf:type        owl:NamedIndividual ,'+'\n')
    f.write('                              :'+child.tag.capitalize()+' ;'+'\n')
    for c in child :
        if c.tag=='author-ref':
            wrotedBy+=':'+c.attrib["authorid"]+',\n'
        elif c.tag=='author':
            autores[c.attrib["id"]]=c.text
            wrotedBy+=':'+c.attrib["id"]+',\n'

        elif c.tag=='editor-ref':
            if c.attrib["authorid"] in editores:
                editedBy+=':'+c.attrib["authorid"]+',\n'
            else:
                editores[c.attrib["authorid"]]=c.text
                editedBy+=':'+c.attrib["authorid"]+',\n'
          
        elif c.tag=='editor':
            if c.attrib["id"] in editores :                        
                editores[c.attrib["id"]]=c.text
                editedBy+=':'+c.attrib["id"]+',\n'
            else : 
                editores[c.attrib["id"]]=c.text
                editedBy+=':'+c.attrib["id"]+',\n'

        else:
            if c.tag=='deliverables':
                for pdf in c:
                    properties+='     :'+pdf.tag+'  "'+pdf.attrib['url']+'"^^xsd:string ;\n'
            else:
                properties+='     :'+c.tag+'  "'+c.text+'"^^xsd:string ;\n'

    if wrotedBy != '     :wrotedBy ' and editedBy == '     :editedBy ' :
        wrotedBy=(wrotedBy[:-1])[:-1] + ";"
        f.write(wrotedBy+'\n')
    elif wrotedBy == '     :wrotedBy ' and editedBy != '     :editedBy ' :
        editedBy=(editedBy[:-1])[:-1] + ";"
        f.write(editedBy+'\n')

    elif wrotedBy != '     :wrotedBy ' and editedBy != '     :editedBy ' :
        editedBy=(editedBy[:-1])[:-1] + ";"
        wrotedBy=(wrotedBy[:-1])[:-1] + ";"
        f.write(wrotedBy+'\n')
        f.write(editedBy+'\n')

    properties=(properties[:-1])[:-1]+'.'
    f.write(properties+'\n\n')

#=========Autores================#
for x,y in autores.items():
    #print(x,y)

    f.write('###  http://www.di.uminho.pt/prc2021/publicacoes#'+x+'\n')
    f.write(':'+x+'  rdf:type owl:NamedIndividual ,\n')
    f.write('              :Author ;\n')
    f.write(':name "'+y+'"^^xsd:string .\n\n')

#=========Editores==============#
for x,y in editores.items():
    if y==None:
        editores[x]=autores[x]

for x,y in editores.items():
    f.write('###  http://www.di.uminho.pt/prc2021/publicacoes#'+x+'\n')
    f.write(':'+x+'  rdf:type owl:NamedIndividual ,\n')
    f.write('              :Editor ;\n')
    f.write(':name "'+y+'"^^xsd:string .\n\n')    

f.write("###  Generated by the OWL API (version 4.5.9.2019-02-01T07:24:44Z) https://github.com/owlcs/owlapi")
f.close()

print("Ficheiro publicacoes.ttl gerado com sucesso ...")