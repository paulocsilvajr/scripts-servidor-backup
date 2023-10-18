#!/bin/bash

BASE=$(dirname $0)
source "$BASE/log.sh"

LOGNAME=$(log_name uptime)

function uptime {


    docker-compose -f docker-compose-uptime.yml -p uptime up -d &&
    docker-compose -f docker-compose-uptime.yml ps

}

function abre_porta_ufw {

    sudo ufw allow 3001
}

criar_pasta_log

echo $(data_hora) | tee -a $LOGNAME

abre_porta_ufw | tee -a $LOGNAME
uptime | tee -a $LOGNAME

echo -e $(data_hora)"\n" | tee -a $LOGNAME