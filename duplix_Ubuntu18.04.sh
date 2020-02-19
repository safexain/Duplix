#!/bin/sh

set -eu

# Duplix
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list

sudo apt update \ sudo apt install mono-devel gtk-sharp2

wget https://github.com/safexain/Duplix/raw/master/duplix-2.0.deb

sudo dpkg -i duplix-2.0.deb \
    && printf '\nDUPLIX installed successfully\n\n'

sudo rm duplix-2.0.deb
wget https://raw.githubusercontent.com/safexain/Duplix/master/duplicati.service
sudo mv duplicati.service /lib/systemd/system/duplicati.service

printf 'Duplix is ready for use...\n\n'
sleep 3

printf '\nAccess your duplix site : \n\n' \ && printf '\n http://localhost:8200/ \n\n'


# Docker Compose
sudo wget \
        --output-document=/usr/local/bin/docker-compose \
        https://github.com/docker/compose/releases/download/1.24.0/run.sh \
    && sudo chmod +x /usr/local/bin/docker-compose \
    && sudo wget \
        --output-document=/etc/bash_completion.d/docker-compose \
        "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose" \
    && printf '\nDocker Compose installed successfully\n\n'
