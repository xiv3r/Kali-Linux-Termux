#!/bin/sh

###
apt install proot-distro
###
proot-distro install debian
###
proot-distro login debian
###
apt update && apt install curl gnupg -y
###
echo "
# deb https://deb.debian.org/debain stable main

deb https://kali.download/kali kali-rolling main contrib non-free non-free-firmware
" >> /etc/apt/sources.list
###
echo "Installing kali gpg keyring..."
###
curl -fsSL https://archive.kali.org/archive-key.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kali-archive-keyring.gpg
###
echo "update and upgrading kali..."
###
apt update && apt upgrade -y

