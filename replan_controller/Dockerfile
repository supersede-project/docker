#SUPERSEDE Replan Controller
FROM ruby:2.4.2
MAINTAINER  Yosu Gorroñogoitia <jesus.gorronogoitia@atos.net>

#Installing requirements
RUN apt-get update && apt-get install -y git postgresql-server-dev-all

#Clone Supersede Replan repository: https://github.com/supersede-project/big_data.git
RUN cd / && git clone https://github.com/supersede-project/replan_controller.git -b development

WORKDIR /replan/replan_controller
RUN bundle update
RUN rake db:migrate
RUN rake db:seed
	
EXPOSE 3000

CMD ["rails", "server", "--binding", "0.0.0.0"]

#Run container with: docker run -d -p 3000:3000 supersede/replan-controller
# Requires: 
# Create image with:  docker build -t supersede/replan-controller .
# Instantiate container with: docker run -d -p 3000:3000 supersede/replan-controller
