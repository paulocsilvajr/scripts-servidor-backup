#!/bin/bash

BASE=$(dirname $0)
source "$BASE/log.sh"

criar_pasta_log
LOGNAME=$(log_name ferramentas-diversas)

function instalar-ferramentas {
    apty="sudo apt install -y"
    $apty git curl wget
    $apty lnav htop nmon nmap tree tuptime tmux iftop neofetch
    $apty virtualbox virtualbox-qt
    $apty docker docker-compose docker-doc
    $apty smartmontools gparted ncdu iotop-c lsscsi
    $apty preload
    $apty python3-pip
    $apty gdebi

    $apty speedtest-cli
    $apty gufw
}

function permissao-docker {
    sudo usermod -aG docker $USER
}

function ativar-ufw() {
    sudo ufw enable
}


echo $(data_hora) | tee -a $LOGNAME

instalar-ferramentas | tee -a $LOGNAME
permissao-docker | tee -a $LOGNAME
ativar-ufw | tee -a $LOGNAME

acho -e $(data_hora)"\n" | tee -a $LOGNAME