# Repositório para armazenar scripts para configuração de um servidor de backups via NextCloud

### Scripts para instalação e configuração de Oh-My-Zsh, Ultimate Vimrc, SSH e outras ferramentas, bem como Docker-Compose para Gogs, Portainer, Uptime Kuma e Servidor NextCloud, testado em Ubuntu 22.04+


- O script **01-ferramentas-diversas.sh** instala e configura do Git, VirtualBox, Docker, Gparted, e outras ferramentas necessárias. Também ativa o firewall do Ubuntu via `ufw` e adiciona o usuário ao grupo do Docker.

- O script **02-oh-my-zsh.sh** instala e configura o ZSH e [Oh my ZSH](https://ohmyz.sh/)

- O scritp **03-ultimate-vimrc.sh** instala e configura o VIM e [Ultimate Vimrc](https://github.com/amix/vimrc)

- O script **04-SSHd.sh** instala e configura o SSH. Para o SSH (porta 22) é adicionado uma excessão ao firewall (ufw) automaticamente na execução do script. Também é criado o usuário **ti** e liberado somente a ele o acesso remoto. Esse é um usuário comum, **SEM permissão de administrador**. Para obter permissão de administrador, após acesso ao SSH com o usuário ti, deve-se logar com algum usuário **sudoer**. Sintaxe: `04-SSHd.sh "senha usuário ti"`

- O script **05-webmim.sh** instala e configura o [webmim](https://webmin.com/) e adiciona excessão ao firewall (ufw). O Webmim fornece um interface web para gerenciamento do servidor com várias ferramentas. Após instalação, disponível em *localhost:10000*.

- O script **06-gogs.sh** instala e configura o [Gogs](https://gogs.io/), via Docker-compose, e adiciona excessão ao firewall (ufw). O Gogs é usado para gerenciar repositórios git. Após instalação, disponível em *localhost:13000*.

- O script **07-portainer.sh** intala e configura o [Portainer](https://www.portainer.io/), via Docker, e adiciona excessão ao firewall (ufw). O Portainer é usado para gerenciar conteineres via uma interface web. Após instalação, disponível em *localhost:9000*.

- O script **08-uptime.sh** instala e configura o [Uptime-Kuma](https://github.com/louislam/uptime-kuma) , via Docker-compose, e adiciona excessão ao firewall (ufw). O Uptime Kuma é usado para acompanhar o estado de serviços.

- O script **09-speedtest.sh** instala e configura o speedtest-cli. Interface de linha de comando para teste de banda de internet usando [Speedtest](https://speedtest.net)


#### Todos os scripts geram um arquivo de log, no formato **YYYYmmdd_nome_do_script**, com os detalhes da execução, dentro do diretório **log**.

> Scripts testados em Máquina Virtual (VirtualBox) com Ubuntu na versão 22.04+.

## Para mais informações sobre a instalação e configuração do NextCloud ver *README.md* na pasta *nextcloud-mariaDB-btrfs*.

### ARQUIVOS
```
README.md: Este arquivo de ajuda.
01-ferramentas_diversas.sh: Instalação e configuração de VirtualBox, Docker, Gparted, Smartmontools, lnav, htop, nmon, nmap, tree e outras ferramentas. Scritp também ativa o firewall do Ubuntu via UFW e adiciona o usuário ao grupo do Docker.
02-oh-my-zsh.sh: Instalação e configuração do ZSH e (Oh my ZSH)[https://ohmyz.sh/].
03-utimate-vimrc.sh: Instalação e configuração do VIM e (Ultimate Vimrc)[https://github.com/amix/vimrc].
04-SSHd.sh: Instalação e configuração do SSH
05-webmim.sh: Instalação e configuração do Webmim
06-gogs.sh: Instalação e configuração do Gogs via Docker-Compose.
07-portainer.sh: Instalação e configuração do Portainer via Docker.
08-uptime.sh: Instalação e configuração do Uptime Kuma via Docker-Compose.
09-speedtest.sh: Instalação e configuração do speedtest-cli
```

### Contato

```
Daniel Adriano Silva Maciulevicius - daniel.maciulevicius@gmail.com
Paulo Carvalho da Silva Junior - pauluscave@gmail.com
```
