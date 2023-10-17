#!/bin/bash

BASE=$(dirname $0)

function criar_pasta_log {
    if [ ! -d $BASE/log ]; then
        mkdir $BASE/log
    else
        echo -e "\nA pasta log já existe!"
    fi
}

function log_name {
    
    if [ $# -eq 0 ]; then
        echo "Informe um parâmetro para a geração do log"
        exit 1
    fi

    DATACOMPLETA=$(date "+%Y%m%d")
    LOGFILE=${BASE}/log/${DATACOMPLETA}_$1.log
    echo $LOGFILE
}


function data_hora {

    echo $(date --rfc-3339=seconds)
}