FROM java:8
MAINTAINER  Yosu Gorroñogoitia <jesus.gorronogoitia@atos.net>

#COPY wso2mb-3.2.0.zip /supersede/wso2mb-3.2.0.zip
RUN wget -P /supersede --user-agent="testuser" --referer="http://connect.wso2.com/wso2/getform/reg/new_product_download"  http://product-dist.wso2.com/products/message-broker/3.2.0/wso2mb-3.2.0.zip
#ADD apache-ant-1.10.1-bin.tar.gz /supersede/
RUN cd /supersede;jar xf wso2mb-3.2.0.zip;cd wso2mb-3.2.0/bin;chmod +x wso2server.sh;export CARBON_HOME=/supersede/wso2mb-3.2.0
#RUN cd /supersede/apache-ant-1.10.1/bin;chmod +x ant
#Configure OFFSET - See CMD execution
#Configure admin password - only works before first execution
RUN sed -i -- 's/<Password>admin<\/Password>/<Password>admin2<\/Password>/g' /supersede/wso2mb-3.2.0/repository/conf/user-mgt.xml
#Below strategy to modify admin password does not work
#RUN cd /supersede/wso2mb-3.2.0/bin;chmod +x chpasswd.sh;export ANT_HOME=/supersede/apache-ant-1.10.1;export PATH=$PATH:${ANT_HOME}/bin;./chpasswd.sh --db-url "jdbc:h2:$CARBON_HOME/repository/database/WSO2CARBON_DB" --username admin --new-password admin2
#Declare ports. When launching an image use -p 9447:9447 flag
EXPOSE 9447
EXPOSE 5676
CMD /supersede/wso2mb-3.2.0/bin/wso2server.sh -DportOffset=4

# Requires: 
# Create image with:  docker build -t supersede/mb .
# Instantiate container with: docker run --name supersede-mb -p 9447:9447 -p 5676:5676 -d supersede/mb
