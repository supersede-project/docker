#Requires MySQL,WSO2 ESB, WSO2 MB 

FROM tomcat:8.0-jre8
MAINTAINER Yosu Gorroñogoitia <jesus.gorronogoitia@atos.net>

#FG/monitoring Orchestrator
ADD webapps/orchestrator.war /usr/local/tomcat/webapps

#FG/Monitoring Repository
ADD webapps/feedback_repository.war /usr/local/tomcat/webapps

#Monitor Manager
ADD webapps/monitormanager.war /usr/local/tomcat/webapps

#Twitter Monitor
ADD webapps/twitterAPI.war /usr/local/tomcat/webapps

#AppStore Monitor
ADD webapps/appStore.war /usr/local/tomcat/webapps

#Google Play Monitor
ADD webapps/googlePlay.war /usr/local/tomcat/webapps

#HttpMonitoring Monitor
ADD webapps/HttpMonitoring.war /usr/local/tomcat/webapps

#JsonLogs Monitor
ADD webapps/JsonLogs.war /usr/local/tomcat/webapps

#PrjMonitoringUserEvents
ADD webapps/PrjMonitoringUserEvents.war /usr/local/tomcat/webapps

#Replan Optimizer
ADD webapps/replan_optimizer.war /usr/local/tomcat/webapps

#Model Repository Manager
ADD webapps/modelrepositorymanager.war /usr/local/tomcat/webapps

#Dependencies: Mysql, Mongo DB

#TODO: In future versions, build and configure WAR from Git repositories
#1- Include docker-container version of IF library
#2- Update WAR configuration access to mysql database 

# for orchestrator.war and feedback_repository.war
# Edit /ch/uzh/ifi/feedback/library/transaction/config.properties: dburl=jdbc:mysql://mysql:3306/ 
# in library /WEB-INF/lib/feedback_library-feedback_library-0.0.1-SNAPSHOT.jar 

# for modelrepositorymanager.war
# Edit /eu/supersede/dynadapt/modelrepository/manager/database/config.properties: dbhost=jdbc:mysql://mysql:3306/model_repository_manager 
# in library /WEB-INF/lib/eu.supersede.dynadapt.modelreposity.manager-0.0.1-SNAPSHOT.jar 

#Launch tomcat from $TOMCAT/bin to avoid the issue to locale the multitenancy.properties

#Modify Tomcat configuration to listen in port 8081, 8005, 8009, 8444
#conf/server.xml
RUN sed -i -- 's/port="8080"/port="8081"/g' /usr/local/tomcat/conf/server.xml
RUN sed -i -- 's/port="8005"/port="8006"/g' /usr/local/tomcat/conf/server.xml
RUN sed -i -- 's/port="8009"/port="8010"/g' /usr/local/tomcat/conf/server.xml
RUN sed -i -- 's/port="8443"/port="8444"/g' /usr/local/tomcat/conf/server.xml
RUN sed -i -- 's/redirectPort="8443"/redirectPort="8444"/g' /usr/local/tomcat/conf/server.xml

EXPOSE 8081

WORKDIR /usr/local/tomcat/bin
CMD ["catalina.sh", "run"]

