# Documentação para instalação e configuração de servidor NextCloud via Docker-compose

Este repositório  cria um conteiner Docker do [NextCloud](htpps://nextcloud.com/), baseado nos modelos apresentados no [Docker Hub do NextCloud](https://hub.docker.com/_/nextcloud), e um conteiner MariaDB para o banco de dados. Para isolar o armazenamento, foi criado um arquivo (`volume.img`) formatado como BTRFS, com armazenamento de 20Gb. Esse arquivo é montado, por padrão, na pasta 'data' do diretório atual. Com o formato BTRFS do volume é possível criar snapshots dos subvolumes 'db' e 'nextcloud'.

NextCloud disponível em **https://localhost:8083** após sua montagem via docker-compose. Foi 
configurado o redirecionamento via Proxy Reverso do Nginx para disponibilizar o NextCloud via HTTPS.

### Docker-compose para configurar um conteiner NextCloud, com banco de dados MariaDB, volume em arquivo formatado como BTRFS e gerenciado via Systemd. Conteineres configurados no Ubuntu 22.04+

### Instalação e Configuração do NextCloud

- Para a primeira inicialização, deve-se criar o volume `volume.img` usando o script *create_volume_btrfs.sh*. Também deve-se gerar os certificados (*auto assinados*) via script `generate_certificate.sh`

- Deve-se usar os scripts `up.sh`, para inicializar e `down.sh` para parar os serviços, porque estes montam e desmotam o volume virtual da imagem BTRFS da pasta *data*.

- Depois de acessar a primeira vez a rota *https://localhost:8083*, execute o script `reconfigure_config.php.sh`, para que seja adicionado no arquivo de configuração do Apache (`config.php`) do NextCloud as definições necessárias para o funcionamento e redirecionamento HTTPS via Nginx.

- Foi criado scripts para usar esses conteineres como serviços do Systemd. Pare os conteineres com o script *down.sh* e use o script `generate_service.sh` para criar os serviços do sistema. Use o comando *systemctl* (start|status|stop) para gerenciar o serviço **nextcloud-btrfs.service**

- Para usar o NextCloud fora do localhost, deve-se alterar a variável `overwritehost` do arquivo *data/nextcloud/config/config.php* de `localhost:8083` para o `endereço externo (IP):8083`. OBS: Lembre-se de habilitar a porta 8083 no firewall (UFW) com o comando *sudo ufw allow 8083*.

## Arquivos
```
create_volume_btrfs.sh: Cria uma imagem com 20Gb de tamanho e formatado como BTRFS. Pode-se alterar o tamanho da imagem na variável {TAMANHO} deste script. Esse script deve ser executado antes de iniciar os serviços via docker-compose.


docker-composer.yml: docker-compose com a configuração dos serviços nextcloud-btrfs-db (define a configuração do Banco de Dados, com variável de ambiente para definir o usuário, senha e nome do banco), nextcloud-btfs-app (define o conteiner para o NextCloud, possui variáveis para comunicação com o BD) e nextcloud-btrfs-proxy (define o Reverse Proxy via Nginx e disponibiliza a aplicação na rota "https://localhost:8083)"

up.sh: Inicia os serviços do Banco de Dados MariaDB e do NextCloud integrados. Também monta o volume BTRFS em pasta 'data'.

down.sh: Desmonta o volume BTRFS e finaliza os serviços citados acima.

mount_volume.sh e umount_volume.sh: Monta e desmonta o volume BTRFS da pasta 'data'. Scripts usados internamente pelos scripts up.sh e down.sh

reconfigure_config.php.sh: Altera o arquivo de configuração './data/nextcloud/config/config.php' adicionando os atributos ('overwritehost' e 'overwriteprotocol') que habilitam o redirecionamento HTTPS via Nginx. Esse arquivo de configuração somente é criado após o primeiro acesso à rota inicial.

ps.sh: Lista os serviços associados ao docker-compose.yml, exibindo seu estado.

generate_service.sh: Script para gerar o serviço 'nextclous-btrfs.service' para usar os conteineres como um serviço do Systemd. Gera os arquivos 'nextcloud-btrfs_up.sh', 'nextcloud-btrfs_down.sh' e 'nextcloud-btrfs.service'.

remove_service.sh: Para e remove o serviço 'nextcloud-btrfs.service' do Systemd

generate_certificate.sh: Gera os certificados para a conexão HTTPS na pasta 'conf.d'.

conf.d: Pasta com os arquivos de configuração do Nginx e os certificados usados no proxy reverso HTTPS

data: Pasta usada como ponto de montagem da aplicação para o Nextcloud (nextcloud) e MariaDb (db). Somente existe enquanto os conteineres estão em execução. Ao pará-los com o script 'down.sh', o volume (./volume.img) é desmontado e a pasta é removida.

nextcloud-btrfs_up.sh e nextcloud-btrfs_down.sh: Scripts criados via script 'generate_service.sh' e usados para iniciar e parar os serviços do docker via serviço do Systemd associado ao arquivo 'nextcloud-btrfs.service'.

.gitignore: arquivo com as excessões para o git.

```
