#!/bin/bash
sudo yum install -y yum-utils
sudo rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
sudo yum-config-manager --add-repo http://download.mono-project.com/repo/centos7/
sudo yum install -y mono-devel
sudo yum install -y epel-release

sudo rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
sudo yum update && yum install -y alien
sudo yum install -y wget 

wget https://github.com/safexain/Duplix/raw/master/duplix-2.0.5.1-2.noarch.rpm
sudo alien -i duplix-2.0.5.1-2.noarch.rpm

sudo rm -rf duplix-2.0.5.1-2.noarch.rpm

printf '\nAccess your duplix site : \n\n' \ && printf '\n http://localhost:8200/ \n\n'


