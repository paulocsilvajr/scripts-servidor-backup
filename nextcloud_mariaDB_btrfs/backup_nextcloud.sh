#!/usr/bin/env bash

BASE=$(dirname 0)
source "$BASE/log.sh"

LOGNAME=$(log_name backup_nextcloud)

SNAPSHOT="data/$(date +%F)_nextcloud"

if [ $# -eq 0 ]; then
    echo "Informe o diretório como parâmetro para a execução do backup"
    exit 1
fi

DESTINO=$(realpath "$1")

function criar_snap {
    
    sudo btrfs subvolume snapshot data/nextcloud $SNAPSHOT -r &&
        echo "Gerado o snapshot '$SNAPSHOT'"

}

function gerar_backup {

    sudo rsync -aPhW $SNAPSHOT $DESTINO &&
        echo "Gerando backup do snapshot '$SNAPSHOT' na pasta '$DESTINO'" 

}

function remover_snap {

    sudo btrfs subvolume delete $SNAPSHOT &&
        echo "Removido snapshot '$SNAPSHOT' após gerado backup"
}

echo $(data_hora) | tee -a $LOGNAME

criar_pasta_log

if [ -d "$DESTINO" ]; then
    criar_snap | tee -a $LOGNAME && 
    gerar_backup | tee -a $LOGNAME && 
    remover_snap | tee -a $LOGNAME
else
    echo "Diretório '$1' não existe"
fi

echo -e $(data_hora)"\n" | tee -a $LOGNAME