#Requires Redis, Postgresql, WSO2 IS, WSO2 DSS, WSO2 ESB, WSO2 MB 

FROM tomcat:8.0-jre8
MAINTAINER Yosu Gorroñogoitia <jesus.gorronogoitia@atos.net>

#Copy multitenancy.properties in $TOMCAT/conf
ADD multitenancy.properties /usr/local/tomcat/conf

#Copy if.properties in $TOMCAT/conf/
ADD if.properties /usr/local/tomcat/conf

#Copy ROOT.war in $TOMCAT/webapps/
RUN rm -rf /usr/local/tomcat/webapps/ROOT/
ADD ROOT.war /usr/local/tomcat/webapps

#Copy admin-user-manager-app.war in $TOMCAT/webapps/
ADD admin-user-manager-app.war /usr/local/tomcat/webapps

#Copy configuration-tools.war in $TOMCAT/webapps/
ADD configuration-tools.war /usr/local/tomcat/webapps

#TODO Launch tomcat from $TOMCAT/bin to avoid the issue to locale the multitenancy.properties
WORKDIR /usr/local/tomcat/bin
CMD ["catalina.sh", "run"]

