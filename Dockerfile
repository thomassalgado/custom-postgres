FROM postgres:9.6
MAINTAINER Mike Dillon <mike@appropriate.io>

ENV POSTGIS_MAJOR 2.5
ENV POSTGIS_VERSION 2.5

RUN apt-get update \
      && apt-cache showpkg postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
      && apt-get install -y postgresql-9.6-postgis-2.5 \
      && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
COPY ./update-postgis.sh /usr/local/bin
