#!/bin/bash
echo -e "\nStarting Docker Image. Please, provide sudo password ...\n"
sudo service docker start

echo -e "\nBuilding Postgresql Image ...\n"
cd postgresql/ && docker build -t supersede/postgres .

echo -e "\nBuilding Mysql Image ...\n"
cd ../mysql/ && docker build -t supersede/mysql .

echo -e "\nBuilding Apache Image ...\n"
cd ../apache/ && docker build -t supersede/apache .

echo -e "\nBuilding WSO2 IS Image ...\n"
cd ../wso2_is/ && docker build -t supersede/is .

echo -e "\nBuilding WSO2 DSS Image ...\n"
cd ../wso2_dss/ && docker build -t supersede/dss .

echo -e "\nBuilding WSO2 ESB Image ...\n"
cd ../wso2_esb/ && docker build -t supersede/esb .

echo -e "\nBuilding WSO2 MB Image ...\n"
cd ../wso2_mb/ && docker build -t supersede/mb .

echo -e "\nBuilding SUPERSEDE Backend Services Image ...\n"
cd ../tomcat-be/ && docker build -t supersede/be .

echo -e "\nBuilding SUPERSEDE Frontend Services Image ...\n"
echo -e "\nRetrieving SUPERSEDE Frontend Services from CI/CD Server ...\n"
cd ../tomcat-fe/ && docker build -t supersede/fe .

echo -e "\nBuilding SUPERSEDE Replan Controller Image ...\n"
cd ../replan_controller/ && docker build -t supersede/replan-controller .

echo -e "\nBuilding SUPERSEDE Dynamic Adaptation Adapter Image ...\n"
cd ../adapter/ && docker build -t supersede/adapter .

echo -e "\nBuilding SUPERSEDE Dynamic Adaptation DM Optimizer Image ...\n"
cd ../dm_optimizer/ && docker build -t supersede/dm-optimizer .

echo -e "\nBuilding SUPERSEDE MDM Frontend Image ...\n"
cd ../mdm-frontend/ && docker build -t supersede/mdm-frontend .

echo -e "\nBuilding SUPERSEDE Dynamic Adaptation DM Optimizer Image ...\n"
cd ../mdm-storage/ && docker build -t supersede/mdm-storage .



