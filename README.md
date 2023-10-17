# Repositório para armazenar scripts para configuração de um servidor de backups via NextCloud

### Scritps para instalação e configuração de Oh-My-Zsh, Ultimate Vimrc, SSH e outras ferramentas, bem como Docker-Compose para Gogs, Portainer, Uptime Kuma e Servidor NextCloud, testado em Ubuntu 22.04+


- O script **01-ferramentas-diversas.sh** instala e configura do Git, VirtalBox, Docker, Gparted, e outras ferramentas necessárias. Também ativa o firewall do Ubuntu via `ufw` e adiciona o usuário ao grupo do Docker.

- O script **02-oh-my-zsh.sh** instala e configura o ZSH e [Oh my ZSH](https://ohmyz.sh/)

- O scritp **03-ultimate-vimrc.sh** instala e configura o VIM e [Ultimate Vimrc](https://github.com/amix/vimrc)

- O script **04-SSHd.sh** instala e configura o SSH. Para o SSH (porta 22) é adicionado uma excessão ao firewall (ufw) automaticamente na execução do script. Também é criado o usuário **ti** e liberado somente a ele o acesso remoto. Esse é um usuário comum, **SEM permissão de administrador**. Para obter ter permissão de administrador, após acesso ao SSH com o usuário ti, deve-se logar com algum usuário **sudoer**. Sintaxe: `04-SSHd.sh "senha usuário ti"`

- O script **05-webmim.sh** instala e configura o webmim, e adiciona excessão ao firewall (ufw).

- O script **06-gogs-up.sh** instala e configura o Gogs via Docker-compose

- O script **07-portainer-up.sh** intala e configura Servidor Portainer via Docker. Fonte [How-To-Geek](https://www.cloudsavvyit.com/8911/how-to-get-started-with-portainer-a-web-ui-for-docker/)

- O script **08-uptime-up.sh** instala e configura Servidor Uptime-Kuma via Docker-compose.

- O script **09-speedtest.sh** instala e configura o speedtest-cli. Interface de linha de comando para teste de banda de internet usando [Speedtest](https://speedtest.net)


#### Todos os scripts geram um arquivo de log, no formato **log_name {nome_do_script}**, com os detalhes da execução, no diretório raiz dos scripts.

> Scripts testados em Máquina Virtual (VirtualBox) com Ubuntu na versão 22.04+

## Para mais informações sobre a instalação e configuração do NextCloud ver README.md na pasta nextcloud-mariadb-btrfs

### ARQUIVOS
```
README.md: Este arquivo de ajuda.
01-ferramentas_diversas.sh: Instalação e configuração de VirtualBox, Docker, Gparted, Smartmontools, lnav, htop, nmon, nmap, tree e outras ferramentas. Scritp também ativa o firewall do Ubuntu via UFW e adiciona o usuário ao grupo do Docker.
02-oh-my-zsh.sh: Instalação e configuração do ZSH e (Oh my ZSH)[https://ohmyz.sh/].
03-utimate-vimrc.sh: Instalação e configuração do VIM e (Ultimate Vimrc)[https://github.com/amix/vimrc].
04-SSHd.sh: Instalação e configuração do SSH
05-webmim.sh: Instalação e configuração do Webmim
06-gogs-up.sh: Instalação e configuração do Gogs via Docker-Compose.
07-portainer_docker.sh: Instalação e configuração do Portainer via Docker.
08-uptime-up.sh: Instalação e configuração do Uptime Kuma via Docker-Compose.
09-speedtest.sh: Instalação e configuração do speedtest-cli
```