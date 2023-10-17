#!/bin/bash

BASE=$(dirname $0)
source="$BASE/log.sh"

LOGNAME=$(log_name gogs-up)


function gogs-up {


    docker-compose -f docker-compose-gogs.yml -p gogs up -d &&
    docker-compose -f docker-compose-gogs.yml ps

}

criar_pasta_log

gogs-up | tee -a $LOGNAME