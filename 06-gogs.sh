#!/bin/bash

BASE=$(dirname $0)
source "$BASE/log.sh"

LOGNAME=$(log_name gogs)


function gogs {


    docker-compose -f docker-compose-gogs.yml -p gogs up -d &&
        docker-compose -f docker-compose-gogs.yml -p gogs ps

}

function abre_porta_ufw {

    sudo ufw allow 10022
    sudo ufw allow 13000
}

criar_pasta_log

echo $(data_hora) | tee -a $LOGNAME

abre_porta_ufw | tee -a $LOGNAME
gogs | tee -a $LOGNAME

echo -e $(data_hora)"\n" | tee -a $LOGNAME