#!/bin/bash

BASE=$(dirname $0)
source="$BASE/log.sh"

LOGNAME=$(log_name gogs-up)

LOGFOLDER="data-gogs"

function gogs-up {


    docker-compose -f docker-compose-gogs.yml -p gogs up -d &&
    docker-compose -f docker-compose-gogs.yml ps

}

if [ ! -d $BASE/$LOGFOLDER ]; then
    mkdir $BASE/$LOGFOLDER
else
    echo "Pasta $LOGFOLDER já existe" | tee -a $LOGNAME
fi 

gogs-up | tee -a $LOGNAME