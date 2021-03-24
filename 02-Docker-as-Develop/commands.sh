docker container --help
docker image --help
docker volume --help


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


#Ex02: Passando argumentos personalizados
#cd folder/Dockerfile
# --------------------------------------------------------
FROM debian
LABEL maintainer "Aluno Docker <ytpessoa at gmail.com>"
ARG S3_BUCKET=files
ENV S3_BUCKET=${S3_BUCKET}
# --------------------------------------------------------

docker image build -t my-image-arg  .
docker container run my-image-arg bash -c 'echo $S3_BUCKET'
#files
docker image build --build-arg S3_BUCKET=myapp -t my-image-arg  .
docker container run my-image-arg bash -c 'echo $S3_BUCKET'
#myapp




#Publicar:
docker image push 




