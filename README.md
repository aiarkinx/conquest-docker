docker build -t dicomsrv ./dicomsrv/

docker build -t wado ./wado/



Инициализируем новую баз

docker run --name pacsdb \
--network=host \
-p 5432:5432 \
-e POSTGRES_DB=conquestdb \
-e POSTGRES_USER=conquest \
-e POSTGRES_PASSWORD=conquestpass \
-d postgres:9.6

docker run \
--network=host \
--rm \
-v /home/anton/docker/conquest/dicomsrv/data:/opt/conquest/data \
dicomsrv ./dgate -v -r


docker run --name dicomsrv \
--network=host \
-p 5678:5678 \
-v /home/anton/docker/conquest/dicomsrv/data:/opt/conquest/data \
-d dicomsrv

docker run --name wado \
--network=host \
-p 80:80 \
-d wado
