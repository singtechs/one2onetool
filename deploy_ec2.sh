#!/bin/bash
IMAGE_VERSION="v_"${BUILD_NUMBER}

# Clean old images 
docker rm -vf $(docker ps -aq)
docker rmi -f $(docker images -aq)
# run the conatiner
docker container run -dt -p 3000:3000 --name one2onetool singtechs/one2onetool:${IMAGE_VERSION}
# check the running container
docker ps