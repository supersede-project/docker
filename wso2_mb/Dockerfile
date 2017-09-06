FROM java:8
COPY wso2mb-3.2.0.zip /supersede/wso2mb-3.2.0.zip
ADD apache-ant-1.10.1-bin.tar.gz /supersede/
RUN cd /supersede;jar xf wso2mb-3.2.0.zip;cd wso2mb-3.2.0/bin;chmod +x wso2server.sh;export CARBON_HOME=/supersede/wso2mb-3.2.0
RUN cd /supersede/apache-ant-1.10.1/bin;chmod +x ant
#Configure OFFSET - See CMD execution
#Configure admin password - only works before first execution
RUN sed -i -- 's/<Password>admin<\/Password>/<Password>admin2<\/Password>/g' /supersede/wso2mb-3.2.0/repository/conf/user-mgt.xml
#Below strategy to modify admin password does not work
#RUN cd /supersede/wso2mb-3.2.0/bin;chmod +x chpasswd.sh;export ANT_HOME=/supersede/apache-ant-1.10.1;export PATH=$PATH:${ANT_HOME}/bin;./chpasswd.sh --db-url "jdbc:h2:$CARBON_HOME/repository/database/WSO2CARBON_DB" --username admin --new-password admin2
#Declare ports. When launching an image use -p 9447:9447 flag
EXPOSE 9447
CMD /supersede/wso2mb-3.2.0/bin/wso2server.sh -DportOffset=4