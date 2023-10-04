#!/bin/bash

BASE=$(dirname $0)

source "$BASE/log.sh"

function instalar-requisitos-zsh {
    sudo apt install -y zsh
}

function instalar-oh-my-zsh {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

instalar-requisitos-zsh | log $0
instalar-oh-my-zsh | log $0
