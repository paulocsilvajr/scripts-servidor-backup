#!/bin/bash

BASE=$(dirname $0)
source "$BASE/log.sh"
LOGNAME=$(log_name oh-my-zsh)

criar_pasta_log

function instalar-requisitos-zsh {
    sudo apt install -y zsh
}

function instalar-oh-my-zsh {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}


echo $(data_hora) | tee -a $LOGNAME

instalar-requisitos-zsh | tee -a $LOGNAME
instalar-oh-my-zsh | tee -a $LOGNAME

echo -e $(data_hora)"\n" | tee -a $LOGNAME