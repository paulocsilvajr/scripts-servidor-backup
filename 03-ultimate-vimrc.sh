#!/bin/bash

BASE=$(dirname $0)
source "$BASE/log.sh"
LOGNAME=$(log_name ultimate-vimrc)

criar_pasta_log

function instalar-requisitos-vim {
    sudo apt install -y vim
}

function instalar-ultimate-vimrc {
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
}

echo $(data_hora) | tee -a $LOGNAME

instalar-requisitos-vim | tee -a $LOGNAME
instalar-ultimate-vimrc | tee -a $LOGNAME

echo -e $(data_hora) | tee -a $LOGNAME