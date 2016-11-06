FROM andrewdotnich/docker-crystal:latest

RUN mkdir -p /usr/local/src/barnabas

WORKDIR /usr/local/src/barnabas

ADD . /usr/local/src/barnabas

RUN shards check || shards install

RUN apt-get update && apt-get install -yy libsqlite3-0 libsqlite3-dev sqlite3

RUN ./build.sh

