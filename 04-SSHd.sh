#!/bin/bash

BASE=$(dirname $0)
source "$BASE/log.sh"

LOGNAME=$(log_name SSHd)

criar_pasta_log

function instalar-sshd {
    sudo apt install -y openssh-server
}

function configurar-sshd {
    echo "Adicionar usuário "ti" para uso em acesso remoto via SSH"
    sudo useradd --system --no-create-home ti
    
    echo -e "\nDefinir a senha informada para o usuário 'ti'"
    echo "ti:$1" | sudo chpasswd

    NOVACONFIG="Allowusers ti\nDenyUsers root esus"
    CONFIGSSH="/etc/ssh/sshd_config"
    COPIACONFIGSSH="${CONFIGSSH}.original"

    echo -e "\nGerar cópia de arquivo de configuração de SSH($CONFIGSSH), adicionar permissão para usuário 'ti' e remover permissão de usuários 'root' e 'esus', se necessário"
    #somente será gerado cópia e adicionado nova configuração se nao foi ainda gerado o backup .original com config original de sshd_config

    ! sudo test -f $COPIACONFIGSSH &&
        sudo cp -v $CONFIGSSH $COPIACONFIGSSH &&
        echo -e $NOVACONFIG | sudo tee -a $CONFIGSSH
    
    echo -e "\nReiniciar serviço do SSH"
    sudo systemctl restart sshd.service

    echo -e "\nAdicionar excessão para SSH em UFW"
    sudo ufw allow ssh
}

if [[ $# -eq 0 ]]; then
    echo "Informe como parâmetro uma senha para o usuário 'ti'" | tee -a $LOGNAME
    exit 1
fi

echo $(data_hora) | tee -a $LOGNAME

instalar-sshd | tee -a $LOGNAME
configurar-sshd $1 | tee -a $LOGNAME

echo -e $(data_hora) | tee -a $LOGNAME 