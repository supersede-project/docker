#SUPERSEDE Metadata Storage
FROM java:8-jdk
MAINTAINER  Yosu Gorroñogoitia <jesus.gorronogoitia@atos.net>

#Installing requirements
RUN apt-get update && apt-get install -y git

#Installing Tomcat
RUN wget http://apache.uvigo.es/tomcat/tomcat-8/v8.0.46/bin/apache-tomcat-8.0.46.tar.gz
RUN tar xvzf apache-tomcat-8.0.46.tar.gz
RUN mv apache-tomcat-8.0.46 /usr/local/tomcat

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
RUN /opt/gradle/bin/gradle war
RUN cp build/libs/metadataStorage.war /usr/local/tomcat/webapps/
		
#Configuring Tomcat ports
RUN sed -i -- 's/port="8080"/port="8082"/g' /usr/local/tomcat/conf/server.xml
RUN sed -i -- 's/port="8005"/port="8007"/g' /usr/local/tomcat/conf/server.xml
RUN sed -i -- 's/port="8009"/port="8011"/g' /usr/local/tomcat/conf/server.xml
RUN sed -i -- 's/port="8443"/port="8445"/g' /usr/local/tomcat/conf/server.xml
RUN sed -i -- 's/redirectPort="8443"/redirectPort="8445"/g' /usr/local/tomcat/conf/server.xml	
	
EXPOSE 8082
# Requires mongodb: link to mongodb container in docker compose

WORKDIR /usr/local/tomcat/bin

CMD ./catalina.sh run


