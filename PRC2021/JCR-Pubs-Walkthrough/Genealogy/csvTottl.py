#!usr/bin/python3

import csv 
with open('jcrfamily.csv',newline='') as csvfile :
    reader = csv.DictReader(csvfile)
    for r in reader:
        print(""" 
###  http://www.di.uminho.pt/prc2021/genealogy#{ind}
                :{ind} rdf:type owl:NamedIndividual ;
                :temMae :{mae} ;
                :temPai :{pai} .
""".format(ind=r['Indivíduo'].replace(' ','_'),mae=r['Mãe'].replace(' ','_'),pai=r['Pai'].replace(' ','_')))