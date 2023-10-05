#!/bin/bash

BASE=$(dirname $0)
source "$BASE/log.sh"

criar_pasta_log

function instalar-requisitos-zsh {
    sudo apt install -y zsh
}

function instalar-oh-my-zsh {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

instalar-requisitos-zsh | tee -a $(log_name)
instalar-oh-my-zsh | tee -a $(log_name)
