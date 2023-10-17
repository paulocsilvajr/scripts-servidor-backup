#!/bin/bash

BASE=$(dirname $0)
source="$BASE/log.sh"

LOGNAME=$(log_name uptime-up)

function uptime-up {


    docker-compose -f docker-compose-uptime.yml -p uptime up -d &&
    docker-compose -f docker-compose-uptime.yml ps

}

criar_pasta_log

uptime-up | tee -a $LOGNAME