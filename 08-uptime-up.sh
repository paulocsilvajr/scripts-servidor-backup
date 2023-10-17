#!/bin/bash

BASE=$(dirname $0)
source "$BASE/log.sh"

LOGNAME=$(log_name uptime-up)

function uptime-up {


    docker-compose -f docker-compose-uptime.yml -p uptime up -d &&
    docker-compose -f docker-compose-uptime.yml ps

}

function abre_porta_ufw {

    sudo ufw allow 3001
}

criar_pasta_log

abre_porta_ufw | tee -a $LOGNAME
uptime-up | tee -a $LOGNAME