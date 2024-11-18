#!/bin/sh

###
apt update && apt install curl gnupg -y
###
curl -fsSL https://archive.kali.org/archive-key.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/kali-archive-keyring.gpg
###
cp /etc/apt/trusted.gpg.d/kali-archive-keyring.gpg /usr/share/keyrings/
###
echo "
# deb https://deb.debian.org/debain stable main
deb [signed-by="/usr/share/keyrings/kali-archive-keyring.gpg"] https://kali.download/kali kali-rolling main contrib non-free non-free-firmware
" > /etc/apt/sources.list
###
apt update && apt upgrade -y

