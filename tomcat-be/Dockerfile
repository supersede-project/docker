#Requires MySQL,WSO2 ESB, WSO2 MB 

FROM tomcat:8.0-jre8
MAINTAINER Yosu Gorroñogoitia <jesus.gorronogoitia@atos.net>

#Copy if.docker.properties in $TOMCAT/conf/
ADD if.docker.properties /usr/local/tomcat/conf

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

#ConfigurationFileHTML
ADD webapps/ConfigurationFileHTMLMonitor.war /usr/local/tomcat/webapps

#Replan Optimizer
ADD webapps/replan_optimizer.war /usr/local/tomcat/webapps

#Model Repository Manager
ADD webapps/modelrepositorymanager.war /usr/local/tomcat/webapps


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

WORKDIR /usr/local/tomcat/bin

#Configure Tomcat BE to use docker IF configuration
RUN sed -e '106iJAVA_OPTS=-Dsupersede.if.properties=if.docker.properties' -i /usr/local/tomcat/bin/catalina.sh

#TODO: unzip WARs and copy if.docker.properties in WEB-INF/classes for all deployed files
RUN cd ../webapps; \
	unzip orchestrator.war -d orchestrator; \
	unzip feedback_repository.war -d feedback_repository; \
	unzip monitormanager.war -d monitormanager; \
	unzip twitterAPI.war -d twitterAPI; \
	unzip appStore.war -d appStore; \
	unzip googlePlay.war -d googlePlay; \
	unzip HttpMonitoring.war -d HttpMonitoring; \
	unzip JsonLogs.war -d JsonLogs; \
	unzip PrjMonitoringUserEvents.war -d PrjMonitoringUserEvents; \
	unzip ConfigurationFileHTMLMonitor.war -d ConfigurationFileHTMLMonitor; \
	unzip replan_optimizer.war -d replan_optimizer; \
	unzip modelrepositorymanager.war -d modelrepositorymanager; 
	
	
RUN cp ../conf/if.docker.properties ../webapps/orchestrator/WEB-INF/classes/; \
	cp ../conf/if.docker.properties ../webapps/feedback_repository/WEB-INF/classes/; \
	cp ../conf/if.docker.properties ../webapps/monitormanager/WEB-INF/classes/; \
	cp ../conf/if.docker.properties ../webapps/twitterAPI/WEB-INF/classes/; \
	cp ../conf/if.docker.properties ../webapps/appStore/WEB-INF/classes/; \
	cp ../conf/if.docker.properties ../webapps/googlePlay/WEB-INF/classes/; \
	cp ../conf/if.docker.properties ../webapps/HttpMonitoring/WEB-INF/classes/; \
	cp ../conf/if.docker.properties ../webapps/JsonLogs/WEB-INF/classes/; \
	cp ../conf/if.docker.properties ../webapps/PrjMonitoringUserEvents/WEB-INF/classes/; \
	cp ../conf/if.docker.properties ../webapps/ConfigurationFileHTMLMonitor/WEB-INF/classes/; \
	cp ../conf/if.docker.properties ../webapps/replan_optimizer/WEB-INF/classes/; \
	cp ../conf/if.docker.properties ../webapps/modelrepositorymanager/WEB-INF/classes/


EXPOSE 8081

WORKDIR /usr/local/tomcat/bin
CMD ["catalina.sh", "run"]


# Requires: Mysql, ESB
# Create image with:  docker build -t supersede/be .
# Instantiate container with: docker run -d -p 8081:8081 --link supersede-mysql:mysql --link supersede-esb:esb supersede/be
