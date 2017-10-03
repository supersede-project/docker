#SUPERSEDE Metadata Frontend
FROM node:8
MAINTAINER  Yosu Gorroñogoitia <jesus.gorronogoitia@atos.net>

#Clone Supersede Big Data repository: https://github.com/supersede-project/big_data.git
RUN apt-get update && apt-get install -y git
RUN cd / && git clone https://github.com/supersede-project/big_data.git 

WORKDIR /big_data/data_management/MetadataManagementSystem/MetadataFrontend

ADD config.js .
RUN cd . && npm install
	
EXPOSE 3001

# Requires: mdm-storage
# Create image with:  docker build -t supersede/mdm-frontend .
# Instantiate container with: docker run -p 3000:3000 --name mdm-frontend -d --link mdm-storage:mdm-storage supersede/mdm-frontend


CMD node app.js


