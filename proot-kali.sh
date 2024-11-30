#!/bin/sh

###
# echo "PS1='\${debian_chroot:+(\$debian_chroot)}\u@kali:\w\$ '" | tee -a /etc/bash.bashrc > /dev/null
wget -O /etc/bash.bashrc https://raw.githubusercontent.com/xiv3r/proot-distro-kali-nethunter/refs/heads/main/bash.bashrc && source /etc/bash.bashrc
###
apt update && apt install curl gnupg -y
###
wget -O /etc/apt/trusted.gpg.d/kali-archive-keyring.asc https://archive.kali.org/archive-key.asc
###
curl -fsSL https://archive.kali.org/archive-key.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/kali-archive-keyring.gpg
###
cp /etc/apt/trusted.gpg.d/kali-archive-keyring.gpg /usr/share/keyrings/
###
echo "
deb [signed-by="/usr/share/keyrings/kali-archive-keyring.gpg"] https://kali.download/kali kali-rolling main contrib non-free non-free-firmware
" > /etc/apt/sources.list
###
apt update && apt full-upgrade -y

