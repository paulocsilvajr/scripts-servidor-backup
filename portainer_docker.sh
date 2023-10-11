#!/bin/bash

BASE=$(dirname $0)
source="$BASE/log.sh"

LOGNAME=$(log_name portainer)

LOGFOLDER="data-portainer"

function portainer-up {

    #Fonte: https://www.cloudsavvyit.com/8911/how-to-get-started-with-portainer-a-web-ui-for-docker/

    docker volume create portainer_data
    docker run -d -p 9000:9000 --name=portainer --restart=unless-stopped -v "/var/run/docker.sock:/var/  run/docker.sock" -v portainer_data:/data portainer/portainer-ce &&
    docker ps

    echo "Para testar o container use http://localhost:9000"
}


if [ ! -d $BASE/$LOGFOLDER ]; then
    mkdir $BASE/$LOGFOLDER
else
    echo "Pasta $LOGFOLDER já existe" | tee -a $LOGNAME
fi 

portainer-up | tee -a $LOGNAME