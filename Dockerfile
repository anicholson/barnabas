FROM andrewdotnich/docker-crystal:latest

RUN mkdir -p /usr/local/src/barnabas

WORKDIR /usr/local/src/barnabas

RUN apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -yy \
                    libsqlite3-0 libsqlite3-dev sqlite3

ADD . /usr/local/src/barnabas

RUN shards check || shards install || shards update

RUN ./build.sh

