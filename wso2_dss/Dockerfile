FROM java:8
#COPY wso2dss-3.5.1.zip /supersede/wso2dss-3.5.1.zip
RUN wget -P /supersede --user-agent="testuser" --referer="http://connect.wso2.com/wso2/getform/reg/new_product_download"  http://product-dist.wso2.com/products/data-services-server/3.5.1/wso2dss-3.5.1.zip
ADD apache-ant-1.10.1-bin.tar.gz /supersede/
RUN cd /supersede;jar xf wso2dss-3.5.1.zip;cd wso2dss-3.5.1/bin;chmod +x wso2server.sh;export CARBON_HOME=/supersede/wso2dss-3.5.1
RUN cd /supersede/apache-ant-1.10.1/bin;chmod +x ant
#Configure OFFSET - See CMD execution
#Configure admin password - only works before first execution
RUN sed -i -- 's/<Password>admin<\/Password>/<Password>admin2<\/Password>/g' /supersede/wso2dss-3.5.1/repository/conf/user-mgt.xml
#Below strategy to modify admin password does not work
#RUN cd /supersede/wso2dss-3.5.1/bin;chmod +x chpasswd.sh;export ANT_HOME=/supersede/apache-ant-1.10.1;export PATH=$PATH:${ANT_HOME}/bin;./chpasswd.sh --db-url "jdbc:h2:$CARBON_HOME/repository/database/WSO2CARBON_DB" --username admin --new-password admin2
#Configure email and other carbon configurations
#Configure Supersede datasources
#Configure Supersede dataservices
#Declare ports. When launching an image use -p 9446:9446 flag
EXPOSE 9446
CMD /supersede/wso2dss-3.5.1/bin/wso2server.sh -DportOffset=3