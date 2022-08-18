#!/bin/bash
IMAGE_VERSION="v_"${BUILD_NUMBER}
REMOTE_USER="ec2-user"
REMOTE_HOST="3.144.71.224"

#sh 'scp deploy.sh ${REMOTE_USER}@${REMOTE_HOST}:~/'
#sh 'ssh ${REMOTE_USER}@${REMOTE_HOST} "chmod +x deploy.sh"'
sh 'ssh ${REMOTE_USER}@${REMOTE_HOST}'

# Clean old images 
docker rm -vf $(docker ps -aq)
docker rmi -f $(docker images -aq)
# run the conatiner
#docker container run -dt -p 3000:3000 --name one2onetool singtechs/one2onetool:${IMAGE_VERSION}
if [ ${1} = "staging" ]; then
    docker container run -dt -p 3000:3000 -e DATA_FILE=Questions-test.json --name one2onetool singtechs/one2onetool:v_s${IMAGE_VERSION}    
else
    docker container run -dt -p 3000:3000 --name one2onetool singtechs/one2onetool:${IMAGE_VERSION}
fi
# check the running container
docker ps

#docker container run -dt -p 3000:3001 -e DATA_FILE=Questions-test.json --name one2onetool-staging singtechs/one2onetool:${IMAGE_VERSION}-staging