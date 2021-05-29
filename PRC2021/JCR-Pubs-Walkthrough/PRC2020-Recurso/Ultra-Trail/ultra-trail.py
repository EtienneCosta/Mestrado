#!/user/bin/python3

import csv 

with open('ultra-trail.utf8.csv',newline='') as csvfile:
    csvlines= csv.reader(csvfile,delimiter=',')
    athlete=""
    teams=""
    challenges=""
    team=set()
    challenge=set()
    next(csvlines, None)  # skip the headers
    for line in csvlines:
        challenge.add(line[4])
        team.add(line[9])
        athlete+="""
###  http://www.di.uminho.pt/prc2021/UltraTrail#{id}
:{id} rdf:type owl:NamedIndividual ;
             :Atleta;
             :pertence :{equipa} ;
             :realiza :{prova} ;
             :DataNascimento "{dob}" ;
             :DataSituação "{dataSituacao}" ;
             :Email "{email}" ;
             :Escalão "{escalao}" ;
             :Morada "{morada}" ;
             :NIF "{nif}" ;
             :Nome "{nome}" ;
             :NumParticipanteEvento "{numEvento}" ;
             :NumParticipanteTipo "{numTipo}" ;
             :Situação "{situacao}" ;
             :Solo "{solo}" ;
             :T-Shirt "{shirt}" ;
             :Telefone "{telefone}" ;
             :TipoPagamento "{pagamento}" ;
             :Valor "{valor}" .\n\n
            """.format(id=line[19].lower().strip().replace(' ','_'), 
                       equipa=line[9].lower().strip().replace(' ','_').replace('.','').replace('/',''),
                       prova=line[4].lower().strip().replace(' ','_'),
                       dob=line[25],
                       dataSituacao=line[3],
                       email=line[27],
                       escalao=line[26],
                       morada=line[11],
                       nif=line[12],
                       nome=line[19],
                       numEvento=line[7],
                       numTipo=line[8],
                       situacao=line[2],
                       solo=line[22],
                       shirt=line[21],
                       telefone=line[10],
                       pagamento=line[6],
                       valor=line[5]
                )

for t in team :
    teams+="""
###  http://www.di.uminho.pt/prc2021/UltraTrail#{id}
:{id} rdf:type owl:NamedIndividual ;
            :Equipa;
            :Nome "{nome}".\n\n 
        """.format(id=t.lower().strip().replace(' ','_').replace('/','').replace('.',''),nome=t)



for c in challenge :
    challenges+="""
###  http://www.di.uminho.pt/prc2021/UltraTrail#{id}
:{id} rdf:type owl:NamedIndividual ;
            :Prova;
            :Nome "{nome}".\n\n 
        """.format(id=c.lower().strip().replace(' ','_'),nome=c)


# Redirecionar o output do programa e colar no ficheiro turtle.

print(athlete)
print(teams)
print(challenges)