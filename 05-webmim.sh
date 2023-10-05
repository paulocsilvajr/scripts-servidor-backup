#!/bin/bash

BASE=$(dirname $0)
source "$BASE/log.sh"

criar_pasta_log

function instalar-webmim { 

    echo -e "\nConfiguração e instalação do Webmim" 

    curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh
    sudo sh setup-repos.sh
  
    sudo apt install -y --install-recommends webmin
}

function abre_porta_ufw {
    sudo ufw allow 10000
}

instalar-webmim | tee -a $(log_name)
abre_porta_ufw | tee -a $(log_name)

rm -v $BASE/setup-repos.sh