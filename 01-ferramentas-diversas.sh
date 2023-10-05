#!/bin/bash

BASE=$(dirname $0)
source "$BASE/log.sh"

criar_pasta_log
LOGNAME=$(log_name ferramentas-diversas)

function instalar-ferramenteas {
    apty="sudo apt install -y"
    $apty git curl wget
    $apty lnav htop nmon nmap tree tuptime tmux iftop neofetch
    $apty virtualbox virtualbox-qt
    $apty docker docker-compose docker-doc
    $apty smartmontools gparted ncdu iotop-c lsscsi
    $apty preload
    $apty python3-pip
    $apty gdebi
}

function permissao-docker {
    sudo usermod -aG docker $USER
}

function ativar-ufw() {
    sudo ufw enable
}

instalar-ferramenteas | tee -a $LOGNAME
permissao-docker | tee -a $LOGNAME
ativar-ufw | tee -a $LOGNAME
