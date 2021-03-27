..../ex04-build-dev$ ls
# Dockerfile  commands.sh  index.html  server-web-python.py
docker image build -t ex04-build-dev .
docker container run -it -v $(pwd):/app -p 8080:8000 --name python-server ex04-build-dev


#Push de Imagem:

docker image ls
# ex04-build-dev
docker image tag ex04-build-dev ytallo/build-dev:1.0
# ex04-build-dev
# ytallo/build-dev:1.0
docker image push ytallo/build-dev:1.0