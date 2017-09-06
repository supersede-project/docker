FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD supersede
#ENV MYSQL_DATABASE supersede
#ENV MYSQL_USER supersede 
#ENV MYSQL_PASSWORD supersede

ADD 1-fb_repository.sql /docker-entrypoint-initdb.d/
ADD 1-fb_orchestrator.sql /docker-entrypoint-initdb.d/
ADD 1-monitoring_orchestrator.sql /docker-entrypoint-initdb.d/
ADD 1-model_manager.sql /docker-entrypoint-initdb.d/
ADD 2-setup.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/2-setup.sh

COPY . /supersede
WORKDIR /supersede

