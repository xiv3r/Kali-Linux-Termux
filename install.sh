#!/bin/bash

apt update ; apt upgrade -y ; apt install wget -y
echo "clear ; nh" >$PREFIX/etc/bash.bashrc
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux


