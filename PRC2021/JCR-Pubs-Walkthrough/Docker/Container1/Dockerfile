# Indicamos a imagem de base 
FROM node:15 
# Criamos a pasta de trabalho dentro da imagem
WORKDIR /app
# Copiamos a nossa app para lá
COPY server1.js .
# Expomos a porta em que irá correr
EXPOSE 7777
# Indicamos como arrancar à aplicação
CMD ["node","server1.js"]