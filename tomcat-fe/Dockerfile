#Requires Redis, Postgresql, WSO2 IS, WSO2 DSS, WSO2 ESB, WSO2 MB 

FROM tomcat:8.0-jre8
MAINTAINER Yosu Gorroñogoitia <jesus.gorronogoitia@atos.net>

#Copy multitenancy.properties in $TOMCAT/conf
ADD multitenancy.properties /usr/local/tomcat/conf

#Copy if.properties in $TOMCAT/conf/
ADD if.properties /usr/local/tomcat/conf

# FRONT-END

#Copy ROOT.war in $TOMCAT/webapps/
RUN rm -rf /usr/local/tomcat/webapps/ROOT/
ADD webapps/ROOT.war /usr/local/tomcat/webapps

#Copy admin-user-manager-app.war in $TOMCAT/webapps/
ADD webapps/admin-user-manager-app.war /usr/local/tomcat/webapps

#Copy configuration-tools.war in $TOMCAT/webapps/
ADD webapps/configuration-tools.war /usr/local/tomcat/webapps

#DM GAME

#Copy supersede-dm-app.war in $TOMCAT/webapps/
ADD webapps/supersede-dm-app.war /usr/local/tomcat/webapps

#Replan Dashboard
ADD webapps/release-planner-app.war /usr/local/tomcat/webapps

#Adaptation Dashboard, 
ADD webapps/adaptation-dashboard.war /usr/local/tomcat/webapps

#Dependencies: Adapter, Replan Optimizer (BE), Replan Controller

#Launch tomcat from $TOMCAT/bin to avoid the issue to locale the multitenancy.properties
WORKDIR /usr/local/tomcat/bin
CMD ["catalina.sh", "run"]

# Requires: Redis, ESB, IS, Postgres
# Create image with:  docker build -t supersede/fe .
# Instantiate container with: docker run -d -p 8080:8080 -v /home/yosu/Projects/Supersede/Git/docker/tomcat-fe/webapps:/usr/local/tomcat/webapps --link supersede-redis:redis --link supersede-esb:esb --link supersede-is:is --link supersede-postgres:postgres --link supersede-mongo:mongodb supersede/fe

