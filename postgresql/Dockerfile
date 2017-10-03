FROM postgres:9.6
MAINTAINER  Yosu Gorroñogoitia <jesus.gorronogoitia@atos.net>

ENV POSTGRES_USER supersede
ENV POSTGRES_PASSWORD supersede

ADD 1-supersede_user.sql /docker-entrypoint-initdb.d/
ADD 2-tenant*.sql /docker-entrypoint-initdb.d/
ADD 3-setup.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/3-setup.sh

COPY . /supersede
WORKDIR /supersede

# Requires: 
# Create image with:  docker build -t supersede/postgres .
# Instantiate container with: docker run --name supersede-postgres -d supersede/postgres