# Um Container por Serviço

# Orquestracao de Container: " Docker Composer "

# Aplicação Monolítica: unica bloco pra ser deployado

# Aplicacao Micro Service: serviços independentes, ciclos diferentes, deploys individuais.


# Exemplo:
    # Service 1(Container 1: Banco de Dados): MongoDB
    # Service 2(Container 2: Back End): Node
    # Service 3(Container 3: Front End): Nginx -> index.html


cd 04-Multiplos-Containers$
$ ls
#backend  commands.sh  docker-compose.yml  frontend

docker-compose up

#Frontend:
curl localhost:8080
    #<h1> Frontend </h1>

#Backend:
curl localhost:3000
    #Backend


