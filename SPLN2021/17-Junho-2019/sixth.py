#!usr/bin/python3
import operator
import re
import requests
from bs4 import BeautifulSoup

race_results= [
    {
    'date':'09 Jun 2019',
    'location': 'Circuit Gilles-Villeneuve, Montreal',
    'race':'GRAND PRIX DU CANADA 2019',
    'standings':[
        {
            'pos':1,
            'laps':70,
            'pts':25,
            'time':'1:29:07.084',
            'driver':'Lewis Hamilton',
            'team': 'Mercedes'
        },
        {
            'pos':2,
            'laps':70,
            'pts':18,
            'time':'+3.658s',
            'driver':'Sebastian Vettel',
            'team': 'Ferrari'
        },
        {
            'pos':3,
            'laps':70,
            'pts':15,
            'time':'+4.696s',
            'driver':'Charles Leclerc',
            'team': 'Ferrari'
        }
    ]
  },
   {
    'date':'09 Jun 2019',
    'location': 'Circuit Gilles-Villeneuve, Montreal',
    'race':'GRAND PRIX DU CANADA 2019',
    'standings':[
        {
            'pos':1,
            'laps':70,
            'pts':25,
            'time':'1:29:07.084',
            'driver':'Lewis Hamilton',
            'team': 'Mercedes'
        },
        {
            'pos':2,
            'laps':70,
            'pts':18,
            'time':'+3.658s',
            'driver':'Sebastian Vettel',
            'team': 'Ferrari'
        },
        {
            'pos':3,
            'laps':70,
            'pts':15,
            'time':'+4.696s',
            'driver':'Charles Leclerc',
            'team': 'Ferrari'
        }
    ]
  }
]

def team_results(results:[dict])->str:
    stats={}
    for r in results:
        standings = r['standings']
        for s in standings:
            if s['team'] not in stats.keys():
                stats[s['team']]=s['pts']
            else:
                stats[s['team']]+=s['pts']
    #Ordenação do dicionário por value, descending ...  reverse=True
    #Ordenação do dicionário, ascending  ...   reverse=False
    #Adicionar as notas ....
    stats = dict( sorted(stats.items(), key=operator.itemgetter(1),reverse=True))
    for key,value in stats.items():
        print(key,value)

#team_results(race_results)

def get_race_results(number:int,location:str)->dict:
    race_results = {}
    standings=[]
    url = f'https://www.formula1.com/en/results.html/2019/races/{number}/{location}/race-result.html'
    html = requests.get(url)
    soup = BeautifulSoup(html.text, 'html.parser')

    date=soup.find('span',{'class': 'full-date'}).string
    location=soup.find('span',{'class': 'circuit-info'}).string.strip()
    race=soup.find('h1',{'class':'ResultsArchiveTitle'}).string.strip().split('-')[0]

    race_results['date']=date
    race_results['location']=location
    race_results['race']=race

    trows=soup.tbody.find_all('tr')

    for tr in trows:
        first_name= tr.find('span',{'class':'hide-for-tablet'}).string.strip()
        last_name= tr.find('span',{'class':'hide-for-mobile'}).string.strip()
        full_name = first_name+' '+last_name
        info= tr.find_all('td',{'class':'dark'})
        pos= info[0].string
        laps=info[1].string
        time=tr.find_all('td', {'class':'dark bold'})[1].text.strip()
        team=tr.find('td',{'class':'hide-for-tablet'}).string
        pts=(tr.find_all('td',{'class':'bold'})[-1].string)
        print(full_name,pos,laps,team,pts,time)
        s={}
        s['pos']=pos
        s['laps']=laps
        s['pts']=pts
        s['time']=time
        s['driver']=full_name
        s['team']=team
        standings.append(s)
    race_results['standings']=standings

    return race_results

         
get_race_results(1000,'australia')