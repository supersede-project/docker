#SUPERSEDE DM Optimizer
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

RUN cd DM/components/eu.supersede.dynadapt.dm.optimizer && \
    ./installGPLibDependency.sh && \
    mvn clean package -Dmaven.test.skip=true
    
WORkDIR DM/components/eu.supersede.dynadapt.dm.optimizer

EXPOSE 8091

# Requires: ESB, MB, Tomcat-BE (Model Repository), Tomcat-FE (Adaptation-Dashboard)
# Create image with:  docker build -t supersede/dm-optimizer .
# Instantiate container with: docker run -d -p 8091:8091 --name dm-optimizer -h dm-optimizer supersede/dm-optimizer

#Update IF configuration
ADD if.docker.properties lib/

#Log configuration
ADD logback.xml lib/

CMD mvn spring-boot:run -Drun.arguments="--server.port=8091" -Dsupersede.if.properties=if.docker.properties
    
