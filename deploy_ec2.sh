#!/bin/bash
IMAGE_VERSION=${BUILD_NUMBER}
REMOTE_USER="ec2-user"
#REMOTE_HOST="3.144.71.224"
REMOTE_HOST="ec2-3-144-71-224.us-east-2.compute.amazonaws.com"

#sh 'scp deploy.sh ${REMOTE_USER}@${REMOTE_HOST}:~/'
#sh 'ssh ${REMOTE_USER}@${REMOTE_HOST} "chmod +x deploy.sh"'
#ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_HOST}
#ssh -o StrictHostKeyChecking=no ec2-user@ec2-3-144-71-224.us-east-2.compute.amazonaws.com
# Clean old images 
docker rm -vf $(docker ps -aq)
docker rmi -f $(docker images -aq)
# run the conatiner
#docker container run -dt -p 3000:3000 --name one2onetool singtechs/one2onetool:${IMAGE_VERSION}
if [ ${1} = "staging" ]; then   
    docker container run -dt -p 3000:3000 -e DATA_FILE=Questions-test.json --name one2onetool singtechs/one2onetool:v_S${IMAGE_VERSION}    
else
    docker container run -dt -p 3000:3000 --name one2onetool singtechs/one2onetool:v_R${IMAGE_VERSION}
fi
# check the running container
docker ps

#docker container run -dt -p 3000:3001 -e DATA_FILE=Questions-test.json --name one2onetool-staging singtechs/one2onetool:${IMAGE_VERSION}-staging