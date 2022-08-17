#!/bin/bash
IMAGE_VERSION="v_"${BUILD_NUMBER}

# Create a new task definition for this build
#sed -e "s;%BUILD_NUMBER%;${BUILD_NUMBER};g" one2onetool$1.json > one2onetoolv_${BUILD_NUMBER}.json
docker rm -vf $(docker ps -aq)
docker rmi -f $(docker images -aq)
docker container run -dt -p 3000:3000 -e DATA_FILE=Questions-test.json --name one2onetool singtechs/one2onetool:${IMAGE_VERSION}