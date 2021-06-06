from bs4 import BeautifulSoup

# Permite fazer a leitura do ficheiro.
with open ('alice.html') as html_doc:
    # Leitura do conteúdo do ficheiro
    alice_doc=html_doc.read()
# Instância do beatifulsoup
soup = BeautifulSoup(alice_doc, 'html.parser')


print(soup.find('a',{'class': 'sister'}).string.strip())

# Pretty print para constatar o conteúdo
#print(soup.prettify())

#print(soup.title) # Imprime a tag e o respectivo conteúdo ...
# <title>The Dormouse's story</title>

#print(soup.title.name) # Imprime o nome da tag ... 
# u'title'


#print(soup.title.string.strip()) # Caso tenha nested values não tem o mesmo comportamento...
## u'The Dormouse's story'


#print(soup.title.parent.name) # Permite capturar o nome da tag que se encontra no nível superior , sem o name devolve o conteúdo dessa parent tag ...
# u'head'

#print(soup.p) # Devolve a primeira ocorrência do p na DOM .., caso não exista retorna None . (Faz pesquisa em nested tags)
# <p class="title"><b>The Dormouse's story</b></p>


#print(soup.p['class']) # Devolve um array com o nome das classes da primeira ocorrência de um "p" na DOM.
# [title]


#print(soup.a)
# <a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>

#print(soup.find_all('a')) #Devolve todas as ocorrências de anchor tags na DOM,bem com o seu conteúdo"
## [<a class="sister" href="http://example.com/elsie" id="link1">Elsie</a>,
##  <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>,
##  <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>]


#sisters_names = soup.find_all('a') # Permite fazer a travessia sobre todas as anchor tags na DOM, e as que forem da class sister é executado a função print do seu conteúdo 
# for s in sisters_names:
#     if s.get('class')[0]=='sister': # Dentro de um elemento permite aceder aos seus atributos .. 
#         print(s.string.strip())


#Para cada elemento imprimir o conjunto dos seus atributos 

#for s in sisters_names:
#    print(s.get_attribute_list('class'))
#    print(s.attrs)



#soup.find(id="link3") # Permite capturar na DOM o elemente com o respectivo ID .
## <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>


# print(soup.get_text()) #Permite imprimir todo o texto presente na página . 