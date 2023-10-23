#!/usr/bin/env bash

BASE=$(dirname $0)

CONFIG=$BASE/data/nextcloud/config/config.php

END=");"
OVERWRITEHOST=" 'overwritehost' => 'localhost:8083',"
OVERWRITEPROTOCOL=" 'overwriteprotocol' => 'https',"

if [ -f $CONFIG ]; then
    
    test_OVERWRITEHOST=$(sudo grep "$OVERWRITEHOST" $CONFIG)
    if [ -z "$test_OVERWRITEHOST" ]; then
        sudo sed -i "s/$END/$OVERWRITEHOST/g" $CONFIG
        echo $END | sudo tee -a $CONFIG
    fi

    test_OVERWRITEPROTOCOL=$(sudo grep "$OVERWRITEPROTOCOL" $CONFIG)
    if [ -z "$test_OVERWRITEPROTOCOL" ]; then
        sudo sed -i "s/$END/$OVERWRITEPROTOCOL/g" $CONFIG
        echo $END | sudo tee -a $CONFIG
    fi

    echo "Reinicie o serviço do Nextcloud para que as alterações das configurações seja aplicado ou execute:"
    echo "docker exec nextcloud-btrfs-container-app /etc/init.d/apache2 reload"

else
    echo "Arquivo de configuração '$CONFIG' não existe ainda, reinicie o Nextcloud na rota 'https://localhosta:8083' no navegador, para que esse arquivo seja criado'."

fi
