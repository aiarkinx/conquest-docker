# Pull OS image
FROM ubuntu:18.04
# Устанавливаем зависимости
ARG DBMS

RUN apt -y update && apt -y install wget \
curl \
unzip \
p7zip-full \
build-essential \
gettext-base \
g++ \
lua5.1 \
lua5.1-dev \
libpq-dev

RUN mkdir -p /opt/conquest/config; mkdir /usr/local/man/man1

WORKDIR /opt/conquest

# Скачивваем и распаковываем conquest
RUN wget https://ingenium.home.xs4all.nl/dicomserver/dicomserver150.zip && unzip dicomserver150.zip



COPY ./makeconquest/maklinux.$DBMS ./maklinux

RUN chmod +x ./maklinux; ./maklinux

COPY ./config/* ./

COPY ./lua/* ./lua/

RUN chmod +x ./docker-entrypoint.sh


ENTRYPOINT ["/opt/conquest/docker-entrypoint.sh"]
