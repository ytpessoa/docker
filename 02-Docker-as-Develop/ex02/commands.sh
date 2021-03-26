#Ex02: Passando argumentos personalizados
#cd folder/Dockerfile
# --------------------------------------------------------
FROM debian
LABEL maintainer "Aluno Docker <ytpessoa at gmail.com>"
ARG S3_BUCKET=files
ENV S3_BUCKET=${S3_BUCKET}
# --------------------------------------------------------

docker image build -t my-debian-arg-02  .

docker container run my-debian-arg-02 bash -c 'echo $S3_BUCKET'
#files

#Passando o arguemento
docker image build --build-arg S3_BUCKET=myapp -t my-debian-arg-02 .

docker container run my-debian-arg-02 bash -c 'echo $S3_BUCKET'
#myapp
