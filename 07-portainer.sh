#!/bin/bash

BASE=$(dirname $0)
source "$BASE/log.sh"

LOGNAME=$(log_name portainer)

function portainer {

    #Fonte: https://www.cloudsavvyit.com/8911/how-to-get-started-with-portainer-a-web-ui-for-docker/

    docker volume create portainer_data
    docker run -d -p 9000:9000 --name=portainer --restart=unless-stopped -v "/var/run/docker.sock:/var/  run/docker.sock" -v portainer_data:/data portainer/portainer-ce &&
        docker container ls -f name=portainer

    echo "Para testar o container use http://localhost:9000"
}

function abre_porta_ufw {

    sudo ufw allow 9000
}

criar_pasta_log

echo $(data_hora) | tee -a $LOGNAME

abre_porta_ufw | tee -a $LOGNAME
portainer | tee -a $LOGNAME

echo -e $(data_hora)"\n" | tee -a $LOGNAME