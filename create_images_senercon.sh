#!/bin/bash
if [ "$#" -lt 1 ]; then
    echo "Usage create_images.sh <supersede@supersede.es.atos.net password> [--no-cache]"
    exit 1
fi

echo -e "\nStarting Docker Image. Please, provide sudo password to start Docker service ...\n"
sudo service docker start

echo -e "\nBuilding Postgresql Image ...\n"
cd postgresql/ && docker build $2 -t supersede/postgres .

echo -e "\nBuilding Mysql Image ...\n"
cd ../mysql/ && docker build $2 -t supersede/mysql .

echo -e "\nBuilding Apache Image ...\n"
cd ../apache/ && docker build $2 -t supersede/apache .

echo -e "\nBuilding WSO2 IS Image ...\n"
cd ../wso2_is/ && docker build $2 -t supersede/is .

echo -e "\nBuilding WSO2 DSS Image ...\n"
cd ../wso2_dss/ && docker build $2 -t supersede/dss .

echo -e "\nBuilding WSO2 ESB Image ...\n"
cd ../wso2_esb/ && docker build $2 -t supersede/esb .

echo -e "\nBuilding WSO2 MB Image ...\n"
cd ../wso2_mb/ && docker build $2 -t supersede/mb .

echo -e "\nBuilding SUPERSEDE Backend Services Image ...\n"
cd ../tomcat-be/ && ./build_be_image_senercon.sh $1

echo -e "\nBuilding SUPERSEDE Frontend Services Image ...\n"
echo -e "\nRetrieving SUPERSEDE Frontend Services from CI/CD Server ...\n"
cd ../tomcat-fe/ && ./build_fe_image_senercon.sh $1

echo -e "\nBuilding SUPERSEDE Replan Controller Image ...\n"
cd ../replan_controller/ && docker build $2 -t supersede/replan-controller .

echo -e "\nBuilding SUPERSEDE MDM Frontend Image ...\n"
cd ../mdm-frontend/ && docker build $2 -t supersede/mdm-frontend .

echo -e "\nBuilding SUPERSEDE Dynamic Adaptation DM Optimizer Image ...\n"
cd ../mdm-storage/ && docker build $2 -t supersede/mdm-storage .



