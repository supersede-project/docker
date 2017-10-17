#SUPERSEDE Metadata Storage
FROM java:8-jdk
MAINTAINER  Yosu Gorroñogoitia <jesus.gorronogoitia@atos.net>

#Installing requirements
RUN apt-get update && apt-get install -y git

#Installing Gradle
RUN wget https://services.gradle.org/distributions/gradle-4.2-bin.zip && \
    unzip gradle-4.2-bin.zip && mv gradle-4.2 /opt/gradle

#Clone Supersede Big Data repository: https://github.com/supersede-project/big_data.git
RUN cd / && git clone https://github.com/supersede-project/big_data.git 

WORKDIR /big_data/data_management/MetadataManagementSystem/MetadataStorage

#WORKAROUND: Modify /etc/hosts
#http://jasonincode.com/customizing-hosts-file-in-docker/
RUN cp /etc/hosts /tmp/hosts
RUN echo '192.168.145.13	supersede.es.atos.net' >> /tmp/hosts
RUN mkdir -p -- /lib-override && cp /lib/x86_64-linux-gnu/libnss_files.so.2 /lib-override
RUN sed -i 's:/etc/hosts:/tmp/hosts:g' /lib-override/libnss_files.so.2
ENV LD_LIBRARY_PATH /lib-override

#Building and deploying MetadataStorage
ADD config.properties .
ADD web.xml src/main/webapp/WEB-INF/
ADD gradle.properties .
RUN /opt/gradle/bin/gradle shadowJar
		
EXPOSE 8082
# Requires: mongodb: link to mongodb container in docker compose
# Create image with:  docker build -t supersede/mdm-storage .
# Instantiate container with: docker run -p 8082:8082 --name mdm-storage -d --link supersede-mongo:mongo supersede/mdm-storage

CMD java -jar build/libs/MetadataStorage-0.0.1-SNAPSHOT.jar config.properties


