#!/bin/bash

BASE=$(dirname $0)

function criar_pasta_log {
    if [ ! -d $BASE/log ]; then
        mkdir $BASE/log
    else
        echo -e "\nA log já existe!"
    fi
}

function log_name {
    DATACOMPLETA=$(date "+%Y%m%d")
    LOGFILE=${BASE}/log/${DATACOMPLETA}_scripts.log
    echo $LOGFILE
}