# rodar em modo daemon "-d":
docker-compose up -d
docker-compose down

docker-compose ps

# Verificar log do Container:
docker container ps -a | head -n 2
docker container logs 46cd91381e3d

docker-compose logs -f -t

# DB:
docker-compose exec db psql -U docker -c '\l'

docker-compose exec db psql -U docker -f /scripts/check.sql

docker-compose exec db psql -U docker -d email_sender -c 'select * from emails'