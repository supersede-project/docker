#SUPERSEDE Adapter
FROM java:8-jdk
MAINTAINER  Yosu Gorroñogoitia <jesus.gorronogoitia@atos.net>

#Installing requirements
RUN apt-get update && apt-get install -y git

#Installing Gradle
RUN wget https://services.gradle.org/distributions/gradle-4.2-bin.zip && \
    unzip gradle-4.2-bin.zip && mv gradle-4.2 /opt/gradle
    
#Installing Maven
RUN wget http://apache.mirrors.nublue.co.uk/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar xvzf apache-maven-3.3.9-bin.tar.gz && mv apache-maven-3.3.9 /opt/maven

#Clone Supersede Dynamic Adaptation repository: https://github.com/supersede-project/dyn_adapt.git 
RUN cd / && git clone https://github.com/supersede-project/dyn_adapt.git -b develop

WORKDIR /dyn_adapt

ENV PATH /opt/maven/bin:$PATH
ENV PATH /opt/gradle/bin:$PATH

RUN ./buildEclipseDependencies.sh

#WORKAROUND: Modify /etc/hosts
#http://jasonincode.com/customizing-hosts-file-in-docker/
RUN cp /etc/hosts /tmp/hosts
RUN echo '192.168.145.13	supersede.es.atos.net' >> /tmp/hosts
RUN mkdir -p -- /lib-override && cp /lib/x86_64-linux-gnu/libnss_files.so.2 /lib-override
RUN sed -i 's:/etc/hosts:/tmp/hosts:g' /lib-override/libnss_files.so.2
ENV LD_LIBRARY_PATH /lib-override

WORkDIR /dyn_adapt/Enactment/components/enactor/eu.supersede.dynadapt.serviceCompositionEnactor
RUN ./installDependencies.sh && \
	mvn clean install && \
	cp target/ServiceCompositionEnactor-0.0.1-SNAPSHOT.jar ../eu.supersede.dynadapt.enactor.EnactorFactory/lib/
	
WORkDIR /dyn_adapt/Enactment/services/eu.supersede.dynadapt.adapter.service
RUN mkdir -p logs && mvn clean package

EXPOSE 8090

# Requires: ESB, Tomcat-BE (Model Repository), Tomcat-FE (Adaptation-Dashboard)
# Create image with:  docker build -t supersede/adapter .
# Instantiate container with: docker run -d -p 8090:8090 --name adapter -h adapter supersede/adapter

#Update IF configuration
ADD if.docker.properties src/main/resources/

#Log configuration
ADD logback.xml src/main/resources/

CMD mvn spring-boot:run -Drun.arguments="--server.port=8090" -Dsupersede.if.properties=if.docker.properties

