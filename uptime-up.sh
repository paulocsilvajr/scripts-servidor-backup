#!/bin/bash

BASE=$(dirname $0)
source="$BASE/log.sh"

LOGNAME=$(log_name uptime-up)

LOGFOLDER="data-uptime"

function uptime-up {


    docker-compose -f docker-compose-uptime.yml -p uptime up -d &&
    docker-compose -f docker-compose-uptime.yml ps

}

if [ ! -d $BASE/$LOGFOLDER ]; then
    mkdir $BASE/$LOGFOLDER
else
    echo "Pasta $LOGFOLDER já existe" | tee -a $LOGNAME
fi 

uptime-up | tee -a $LOGNAME