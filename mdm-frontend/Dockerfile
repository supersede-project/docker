#SUPERSEDE Metadata Frontend
FROM node:8
MAINTAINER  Yosu Gorroñogoitia <jesus.gorronogoitia@atos.net>

#Clone Supersede Big Data repository: https://github.com/supersede-project/big_data.git
RUN apt-get update && apt-get install -y git
RUN cd / && git clone https://github.com/supersede-project/big_data.git 

WORKDIR /big_data/data_management/MetadataManagementSystem/MetadataFrontend

ADD config.js .
RUN cd . && npm install
	
EXPOSE 3000

# Requires mdm-storage

CMD node app.js


