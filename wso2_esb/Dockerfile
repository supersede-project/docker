FROM java:8
#COPY wso2esb-5.0.0.zip /supersede/wso2esb-5.0.0.zip
#ADD apache-ant-1.10.1-bin.tar.gz /supersede/
RUN wget -P /supersede --user-agent="testuser" --referer="http://connect.wso2.com/wso2/getform/reg/new_product_download"  http://product-dist.wso2.com/products/enterprise-service-bus/5.0.0/wso2esb-5.0.0.zip
RUN cd /supersede;jar xf wso2esb-5.0.0.zip;cd wso2esb-5.0.0/bin;chmod +x wso2server.sh;export CARBON_HOME=/supersede/wso2esb-5.0.0
#RUN cd /supersede/apache-ant-1.10.1/bin;chmod +x ant
#Configure OFFSET - See CMD execution
#Configure admin password - only works before first execution
RUN sed -i -- 's/<Password>admin<\/Password>/<Password>admin2<\/Password>/g' /supersede/wso2esb-5.0.0/repository/conf/user-mgt.xml
#Below strategy to modify admin password does not work
#RUN cd /supersede/wso2esb-5.0.0/bin;chmod +x chpasswd.sh;export ANT_HOME=/supersede/apache-ant-1.10.1;export PATH=$PATH:${ANT_HOME}/bin;./chpasswd.sh --db-url "jdbc:h2:$CARBON_HOME/repository/database/WSO2CARBON_DB" --username admin --new-password admin2

#Configure email and other carbon configurations: see https://docs.google.com/document/d/1_ZhmgzNEiNmVoXKlL1Zgc4AcxAJxrh2OrNIPBl7frqw/edit#
RUN sed -i "/<\/messageFormatters>/ s/.*/\t<messageFormatter contentType= \"text\/html\"\n\t\t\tclass=\"org.apache.axis2.transport.http.ApplicationXMLFormatter\"\/>\n&/" /supersede/wso2esb-5.0.0/repository/conf/axis2/axis2.xml

RUN sed -i "/<\/axisconfig>/ s/.*/\t<transportSender name=\"mailto\" class=\"org.apache.axis2.transport.mail.MailTransportSender\">\n\t\t<parameter name=\"mail.smtp.host\">smtp.gmail.com<\/parameter>\n\t\t<parameter name=\"mail.smtp.port\">587<\/parameter>\n\t\t<parameter name=\"mail.smtp.starttls.enable\">true<\/parameter>\n\t\t<parameter name=\"mail.smtp.auth\">true<\/parameter>\n\t\t<parameter name=\"mail.smtp.user\">supersedeproject@gmail.com<\/parameter>\n\t\t<parameter name=\"mail.smtp.password\">$upR$Pjct0<\/parameter>\n\t\t<parameter name=\"mail.smtp.from\">supersedeproject@gmail.com<\/parameter>\n\t<\/transportSender>\n&/" /supersede/wso2esb-5.0.0/repository/conf/axis2/axis2.xml

#Upload Supersede modules
COPY *.car /supersede/wso2esb-5.0.0/repository/deployment/server/carbonapps/
WORKDIR /supersede

#Declare ports. When launching an image use -p 9443:9443 flag
EXPOSE 9443
CMD /supersede/wso2esb-5.0.0/bin/wso2server.sh -DportOffset=0