FROM httpd:2.4
MAINTAINER  Yosu Gorroñogoitia <jesus.gorronogoitia@atos.net>

RUN apt-get update && apt-get install -y vim
COPY ./www/supersede/html /www/supersede/html
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf