#!usr/bin/python3
import re

# Questão 4. 
"""
Suponha que dispomos de uma tabela de polaridade de palavra que a
cada palavra associe um número no intervalor [-1:+1], sendo -1 
associado a sentimento muito negativo, 0 a neutro e +1 francamente
positivo. Suponha também que existe uma coleção de notícias (textos).

Escreva uma função Python que receba :
(i) Uma string com um nome (ex: "José Mourinho")
(ii) Um dicionário com a polaridade das palavras
(iii) Uma lista com as notícias.
"""

n1="""
Itália é o capítulo perfeito na carreira de José Mourinho. Em duas épocas (2008-10) no Inter, o técnico português foi bicampeão e venceu a Liga dos Campeões, além de erguer uma Taça de Itália e uma Supertaça. Voltar ao calcio para treinar a Roma é um desafio à sua própria história, numa altura em que muitos questionam se o special one não perdeu o toque de midas que revolucionou o futebol há quase 20 anos. Afinal ainda há dias foi despedido do Tottenham...
Liderar um clube histórico, mas com poucos troféus no museu - só tem três campeonatos em 93 anos de história -, que está em 7.º na liga italiana e que pode falhar as competições europeias do próximo ano é um risco que o setubalense está decidido a correr, para mostrar que é capaz de se reinventar.
O contexto atual é bem diferente do que aquele que o levou ao Inter em 2008. Desta vez chegará com a carga de ter sido despedido por três vezes consecutivas (Chelsea, Manchester United e Tottenham) e não tem (para já) um plantel de luxo à sua disposição. Mas Mourinho acredita que a Roma é o clube ideal para voltar à ribalta.
"""
n2="""
José Mourinho é o técnico português com mais troféus (25) e espera engordar a vitrina em Itália. "Queremos construir um trilho glorioso nos próximos anos. A incrível paixão dos adeptos da Roma convenceu-me a aceitar o desafio e mal posso esperar para o início da próxima época", confessou no Instagram, desejando sorte a Fonseca.
"""
news=[n1,n2]

def ocurrencesAndwords(nome:str,news:[str]):
    words=set()
    ocurrences=0
    for n in news:
        founded=re.findall(f'.*José Mourinho.*',n)
        for f in founded:
            temp = f.split('José Mourinho')
            for t in temp:
                for i in t.split(' '):
                    words.add(i)
        ocurrences+=len(founded)
    
    return ocurrences,words

occurrences,words=ocurrencesAndwords("José Mourinho",news)

def indicePopularidade(nome:str,d:dict,news:[str]):
    occurrences,words=ocurrencesAndwords(nome,news)
    t = 0
    for w in words:
        if w in d.keys():
            t+=d[w]
    return t/occurrences
        
#Missing dicionário .. 

print(indicePopularidade("José Mourinho",{},news))