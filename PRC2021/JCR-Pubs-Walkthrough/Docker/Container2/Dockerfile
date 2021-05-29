# Indicamos a imagem de base 
FROM python 
# Instalamos o módulo requests 
RUN pip install requests

# Criamos a pasta de trabalho dentro da imagem
WORKDIR /app 

# Copiamos o resto 
COPY clav.py .

# Vamos buscar a informação e gravamos num ficheiro 
RUN ["python", "clav.py"]

#Expomos a pasta 
CMD python -m http.server