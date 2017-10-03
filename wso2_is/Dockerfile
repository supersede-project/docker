FROM java:7
MAINTAINER  Yosu Gorroñogoitia <jesus.gorronogoitia@atos.net>

RUN wget -P /supersede --user-agent="testuser" --referer="http://connect.wso2.com/wso2/getform/reg/new_product_download"  http://product-dist.wso2.com/products/identity-server/5.0.0/wso2is-5.0.0.zip
#ADD apache-ant-1.10.1-bin.tar.gz /supersede/
RUN cd /supersede;jar xf wso2is-5.0.0.zip;cd wso2is-5.0.0/bin;chmod +x wso2server.sh;export CARBON_HOME=/supersede/wso2is-5.0.0
#RUN cd /supersede/apache-ant-1.10.1/bin;chmod +x ant
#Configure OFFSET - See CMD execution
#Configure admin password - only works before first execution
RUN sed -i -- 's/<Password>admin<\/Password>/<Password>admin2<\/Password>/g' /supersede/wso2is-5.0.0/repository/conf/user-mgt.xml
#Below strategy to modify admin password does not work
#RUN cd /supersede/wso2is-5.3.0/bin;chmod +x chpasswd.sh;export ANT_HOME=/supersede/apache-ant-1.10.1;export PATH=$PATH:${ANT_HOME}/bin;./chpasswd.sh --db-url "jdbc:h2:$CARBON_HOME/repository/database/WSO2CARBON_DB" --username admin --new-password admin2

#See https://docs.wso2.com/display/IS500/Upgrading+from+a+Previous+Release
#to migrate from a previous IS instance
#Configure tenants
#Configure identity service providers

#Copy <OLD_IS_HOME>/repository/data to <NEW_IS_HOME>/repository/data
RUN rm -rf /supersede/wso2is-5.0.0/repository/data/
ADD wso2is-5.0.0/data /supersede/wso2is-5.0.0/repository/data/

RUN rm -rf /supersede/wso2is-5.0.0/repository/database/
ADD wso2is-5.0.0/database /supersede/wso2is-5.0.0/repository/database/

#Copy the .jks files from the <OLD_IS_HOME>/repository/resources/security folder and paste them in <NEW_IS_HOME>/repository/resources/security folder
RUN rm -rf /supersede/wso2is-5.0.0/repository/resources/security/*.jks
ADD wso2is-5.0.0/*.jks /supersede/wso2is-5.0.0/repository/resources/security/

#If you have created tenants in the previous WSO2 Identity Server version and if there are any resources in the <OLD_IS_HOME>/repository/tenants directory, copy the content to the <NEW_IS_HOME>/repository/tenants directory.
RUN rm -rf /supersede/wso2is-5.0.0/repository/tenants/
ADD wso2is-5.0.0/tenants /supersede/wso2is-5.0.0/repository/tenants/

#Configure wso2is-5.0.0/repository/conf/carbon.xml In section Axis2Config: disable <HideAdminServiceWSDLs>false</HideAdminServiceWSDLs>
RUN sed -i -- "s/<HideAdminServiceWSDLs>true<\/HideAdminServiceWSDLs>/<HideAdminServiceWSDLs>false<\/HideAdminServiceWSDLs>/g" /supersede/wso2is-5.0.0/repository/conf/carbon.xml

#Declare ports. When launching an image use -p 9445:9445 flag
EXPOSE 9445
CMD /supersede/wso2is-5.0.0/bin/wso2server.sh -DportOffset=2

# Requires: 
# Create image with:  docker build -t supersede/is .
# Instantiate container with: docker run --name supersede-is -p 9445:9445 -d supersede/is
