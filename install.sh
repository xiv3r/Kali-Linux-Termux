#!/bin/bash

apt install wget -y
###
echo "
clear
nh
" >> $PREFIX/etc/bash.bashrc
###
wget -O install-nethunter-termux https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/install-nethunter-termux
###
chmod +x install-nethunter-termux

