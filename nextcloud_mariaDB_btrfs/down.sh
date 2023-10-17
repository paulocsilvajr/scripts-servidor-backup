#!/usr/bin/env bash

BASE=$(dirname $0)
source "$BASE/log.sh"

LOGNAME=$(log_name down)

function down {

    docker-compose -p nextcloud-btrfs -f $BASE/docker-compose.yml down &&
        $BASE/umount_volume.sh &&
        echo "Parado o container e desmontado o volume baseado no arquivo volume.img" ||
        echo "Ocorreu um erro ao executar o script down.sh" 
}

criar_pasta_log

down | tee -a $LOGNAME