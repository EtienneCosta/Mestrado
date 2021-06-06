#!usr/bin/python3
import datetime 
import requests
from bs4 import BeautifulSoup
"""
Questão 6. 

Pretende-se construir uma aplicação de linha de comandos para consultar a previsão de meteorologia na página do Instituto Português do Mar e da Atmosfera.

(a) Assuma que existe uma variável weather que contém dados da previsão para esta semana, no seguinte formato:

weather = [
            { date: '2 Dom',
              prev_txt: 'Céu nublado por nuvens altas',
              temp_min: 13, 
              temp_max: 28, 
              uv: 8
            }, 
            { date: '3 Seg',
              prev_txt: 'Céu pouco nublado',
              temp_min: 11, 
              temp_max: 27, 
              uv: 9
            }, 
            { date: '6 Qua',
              prev_txt: 'Céu limpo',
              temp_min: 11, 
              temp_max: 31,
              uv:9
            }
         ]


Implemente uma função conselhos_da_avo() que recebe a variável weather e 
imprime “Leva um casaco!” se a temperatura mínima de hoje estiver abaixo dos 15◦C, 
e “Sai do sol que faz mal!” se o índice UV estiver acima de 7. 
O módulo datetime exporta uma variável date que pode ser usada para obter o dia do mês em que estamos:
date.today().day.

"""

def conselhos_da_avo(weather:dict):
    dia = str(datetime.date.today().day)
    message=''
    for w in weather:

        wdia = w['date'].split(' ')[0]
        if dia == wdia:
            if w['temp_min']<15:
                print('Leva um casaco ! Temperatura mínima: '+str(w['temp_min'])+'°C')
            if w['uv'] > 7 :
                print('Sai do sol que faz mal ! Índice UV: '+str(w['uv']))

weather = [
            { 'date': '2 Dom',
              'prev_txt': 'Céu nublado por nuvens altas',
              'temp_min': 13, 
              'temp_max': 28, 
              'uv': 8
            }, 
            { 'date': '3 Seg',
              'prev_txt': 'Céu pouco nublado',
              'temp_min': 11, 
              'temp_max': 27, 
              'uv': 9
            }, 
            { 'date': '6 Qua',
              'prev_txt': 'Céu limpo',
              'temp_min': 11, 
              'temp_max': 31,
              'uv':9
            }
         ]

#conselhos_da_avo(weather)

"""
Supondo que o URL para consultar a previsão meteorológica para Barcelos é
http://www.ipma.pt/Braga&Barcelos PAGE NOT FOUND 

implemente a função get_weather, que:
•recebe como parâmetros o distrito e o concelho
•faz scrapping da página correspondente
•extrai a informação relevante usando a biblioteca BeautifulSoup
•devolve a informação extraída no mesmo formato da variável weather da alínea anterior
"""

def get_weather(distrito:str,concelho:str)->[dict]:
    #url=f'http://www.ipma.pt/{distrito}&{concelho}' # PAGE NOT FOUND... 
    #html=requests.get(url).text
    #soup = BeautifulSoup(html, 'html.parser')
    with open ('weather.html') as html_doc:
        # Leitura do conteúdo do ficheiro
        weather_html=html_doc.read()
        # Instância do beatifulsoup
        soup = BeautifulSoup(weather_html, 'html.parser')
    weather_info=[]

    for i in range(2,4):
        week=soup.find('div',{'id': i})
        date=week.find('div',{'class':'date'}).string
        prev_text=week.find('img',{'class':'weatherImg'})['title']
        temp_min=week.find('span',{'class':'tempMin'}).string.split('o')[0]
        temp_max=week.find('span',{'class':'tempMax'}).string.split('o')[0]
        uv=week.find('img',{'class':'iuvImg'})['title'].split(':')[1].strip()
        info={}

        info['date']=date
        info['prev_txt']=prev_text
        info['temp_min']=temp_min
        info['temp_max']=temp_max
        info['uv']=uv
        weather_info.append(info)

    return weather_info
        

info=get_weather('','')

print(info)
