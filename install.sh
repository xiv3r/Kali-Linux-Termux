#!/bin/bash

apt update ; apt upgrade -y ; apt install wget -y
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod +x install-nethunter-termux
echo "clear ; nh" >$PREFIX/etc/bash.bashrc
./install-nethunter-termux
