
# [![SUPERSEDE](images/SUPERSEDE-logo.png)](https://www.supersede.eu/) Platform: Docker images and launchers

This section provides instructions to download the SUPERSEDE platform containers, build the
container images and start up the platform. Instructions are given for Linux-based OS. For
other OSs, adapt the instructions accordingly.

Requirements:
* Docker: To get, install and start Docker as a service in your computer, follow the
instructions given at: https://docs.docker.com/engine/installation/
* Docker Compose: follow this instructions to get and install Docker Compose:
https://docs.docker.com/compose/install/

Once Docker is installed and running, proceed with the following instructions to obtain the
SUPERSEDE platform containers and start up the platform:
1. Clone the SUPERSEDE platform containers repository from GitHub, using:
`git clone https://github.com/supersede-project/docker.git`
2. Change to the docker directory created. In a CMI execute the script:
`./create_images.sh <supersede@supersede.es.atos.net password>`
Ask the SUPERSEDE Administrator for the supersede account of the
supersede.es.atos.net server. The script will prompt you for your root account, required
to start the Docker daemon.
This script will take long time to download the dependencies and create the images, but
this process takes place only once.
3. To start up the entire platform, any time, execute the following script in CMI:
`./docker-compose -f docker_compose_supersede.yml up`

See deliverable D5.6 in [Supersede Portal](https://www.supersede.eu/) for more details about this Docker images, how to build them, and how to launch the SUPERSEDE platform components.

SUPERSEDE Docker images are licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)

Main contact: Jesús Gorroñogoitia <jesus.gorronogoitia@atos.net>

![Project funded by the European Union](images/european.union.logo.png)
