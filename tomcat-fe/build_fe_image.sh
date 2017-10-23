if [ "$#" -ne 1 ]; then
    echo "Usage build_fe_image.sh <supersede@supersede.es.atos.net password>"
    exit 1
fi

echo -e "\nRetrieving SUPERSEDE Frontend Services from CI/CD Server ...\n"
PASSWORD=$1
USER=supersede
HOST=supersede.es.atos.net

mkdir -p webapps

#Frontend
echo -e "\nRetrieving SUPERSEDE Frontend ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/Supersede\ FE/workspace/applications/supersede-frontend/build/libs/supersede-frontend-0.2.1-SNAPSHOT.war
FILE_OUT=./webapps/ROOT.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT


#Copy admin-user-manager-app.war in $TOMCAT/webapps/
echo -e "\nRetrieving SUPERSEDE Frontend Admin User Manager...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/Supersede\ FE/workspace/applications/admin-user-manager-app/build/libs/admin-user-manager-app-0.2.1-SNAPSHOT.war
FILE_OUT=./webapps/admin-user-manager-app.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT

#Copy configuration-tools.war in $TOMCAT/webapps/
echo -e "\nRetrieving SUPERSEDE Frontend Configuration Tools ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/Supersede\ FE/workspace/applications/configuration-tools/build/libs/configuration-tools-0.0.1-SNAPSHOT.war
FILE_OUT=./webapps/configuration-tools.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT

#Copy supersede-dm-app.war in $TOMCAT/webapps/
echo -e "\nRetrieving SUPERSEDE Frontend DM App ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/DM\ Game/workspace/applications/supersede-dm-app/build/libs/dm-app-0.0.2-M18.war
FILE_OUT=./webapps/supersede-dm-app.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT


#Replan Dashboard
echo -e "\nRetrieving SUPERSEDE Frontend Replan Dashboard ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/Replan\ Dashboard/workspace/replan_dashboard/release-planner-app/build/libs/release-planner-app-0.2-SNAPSHOT.war
FILE_OUT=./webapps/release-planner-app.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT

#Adaptation Dashboard, 
echo -e "\nRetrieving SUPERSEDE Frontend Adaptation dashboard ...\n"
FILE_IN=/opt/jenkins/apps/jenkins/jenkins_home/jobs/DynamicAdaptation/workspace/Enactment/components/adapter/model/adaptation-dashboard/build/libs/adaptation-dashboard-0.0.1-SNAPSHOT.war
FILE_OUT=./webapps/adaptation-dashboard.war
sshpass -p "$PASSWORD" scp $USER@$HOST:"\"$FILE_IN\"" $FILE_OUT

echo -e "\nBuilding SUPERSEDE Frontend Services Image ...\n"
docker build -t supersede/fe .

