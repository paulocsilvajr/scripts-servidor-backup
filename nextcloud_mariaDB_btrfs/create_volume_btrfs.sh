#!/usr/bin/env bash

BASE=$(dirname $0)
source "$BASE/log.sh"

LOGNAME=$(log_name create_volume_btrfs)


ARQUIVO=volume.img
ARQUIVO=${BASE}/${ARQUIVO}

TAMANHO=20G #Tamanho em Gb

function create_volume_btrfs {

    if [ -f "$ARQUIVO" ]; then
        echo "Arquivo '$ARQUIVO' já existe" &&
            file "$ARQUIVO"
    else
        echo "Criando volume BTRFS de $TAMANHO... denominado '$ARQUIVO'"

        fallocate -l ${TAMANHO} "$ARQUIVO" &&
            sudo mkfs.btrfs -f "$ARQUIVO" 
    fi
}

criar_pasta_log

create_volume_btrfs | tee -a $LOGNAME