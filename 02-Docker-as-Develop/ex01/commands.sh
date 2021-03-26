##### Criar Imagem - Buildar ####

# Dockerfile -> docker image build -> docker container run


#Ex01:
#cd folder/Dockerfile
#------
FROM nginx:latest 
RUN echo '<h1> Hello Word Ytallo!</h1>' > /usr/share/nginx/html/index.html
#------

docker image build -t my-image-tag .		 #cria imagem:build
docker image ls								 #verifica: ls
docker container run -p 8080:80 imagem-yta-1 #executa: run

#Testar
curl localhost:8080
# <h1> Hello Word Ytallo!</h1>	


docker container ls
docker container stop 7d537a755dbb