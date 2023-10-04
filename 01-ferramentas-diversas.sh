#!/bin/bash

BASE=$(dirname $0)
source "$BASE/log.sh"

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

instalar-ferramenteas | log $0
permissao-docker | log $0
ativar-ufw | log $0
