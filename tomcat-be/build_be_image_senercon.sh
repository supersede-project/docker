if [ "$#" -lt 1 ]; then
    echo "Usage build_be_image.sh <supersede@supersede.es.atos.net password> [--no-cache]"
    exit 1
fi

echo -e "\nRetrieving SUPERSEDE Backend Services from CI/CD Server ...\n"
PASSWORD=$1
USER=supersede
HOST=supersede.es.atos.net

mkdir -p webapps

#AppStore Monitor
echo -e "\nRetrieving SUPERSEDE AppStore Monitor ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/MonitorManagerAndMonitors/workspace/monitors/appStore/build/libs/appStore.war
FILE_OUT=./webapps/appStore.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT

#GooglePlay Monitor
echo -e "\nRetrieving SUPERSEDE GooglePlay Monitor ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/MonitorManagerAndMonitors/workspace/monitors/googlePlay/build/libs/googlePlay.war
FILE_OUT=./webapps/googlePlay.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT

#Twitter Monitor
echo -e "\nRetrieving SUPERSEDE Twitter Monitor ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/MonitorManagerAndMonitors/workspace/monitors/twitter/build/libs/twitterAPI.war
FILE_OUT=./webapps/twitterAPI.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT

#HTTP Monitor
echo -e "\nRetrieving SUPERSEDE HTTP Monitor ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/MonitorManagerAndMonitors/workspace/monitors/HttpMonitoring/build/libs/HttpMonitoring.war
FILE_OUT=./webapps/HttpMonitoring.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT

#JsonLogs Monitor
echo -e "\nRetrieving SUPERSEDE JsonLogs Monitor ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/MonitorManagerAndMonitors/workspace/monitors/JsonLogs/build/libs/JsonLogs.war
FILE_OUT=./webapps/JsonLogs.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT

#PrjMonitoringUserEvents Monitor
echo -e "\nRetrieving SUPERSEDE PrjMonitoringUserEvents Monitor ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/MonitorManagerAndMonitors/workspace/monitors/MonitoringUserEvents/PrjMonitoringUserEvents/target/PrjMonitoringUserEvents-0.0.1-SNAPSHOT.war
FILE_OUT=./webapps/PrjMonitoringUserEvents.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT

#ConfigurationFileHTML Monitor
echo -e "\nRetrieving SUPERSEDE ConfigurationFileHTML Monitor ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/MonitorManagerAndMonitors/workspace/monitors/ConfigurationFileHTMLMonitor/target/ConfigurationFileHTMLMonitor.war
FILE_OUT=./webapps/ConfigurationFileHTMLMonitor.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT

#Monitoring Manager
echo -e "\nRetrieving SUPERSEDE Monitoring Manager ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/MonitorManagerAndMonitors/workspace/monitormanager/build/libs/monitormanager-0.1.0.war
FILE_OUT=./webapps/monitormanager.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT

#Feedback Repository 
echo -e "\nRetrieving SUPERSEDE Feedback Repository ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/Feedback\ Repository/workspace/repository/target/feedback_repository.war
FILE_OUT=./webapps/feedback_repository.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT

#Orchestrator 
echo -e "\nRetrieving SUPERSEDE Orchestrator ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/Feedback\ Orchestrator/workspace/orchestrator/target/orchestrator.war
FILE_OUT=./webapps/orchestrator.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT

#Replan Optimizer 
echo -e "\nRetrieving SUPERSEDE Replan Optimizer ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/Replan\ Optimizer/workspace/build/libs/replan_optimizer-0.0.1.war
FILE_OUT=./webapps/replan_optimizer.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT


echo -e "\nBuilding SUPERSEDE Backend Services Image ...\n"
docker build $2 -t supersede/be -f Dockerfile_Senercon .

