#!/bin/sh

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
# deb [signed-by="/usr/share/keyrings/debian-archive-keyring.gpg"] http://deb.debian.org/debian bookworm main contrib

# deb [signed-by="/usr/share/keyrings/debian-archive-keyring.gpg"] http://deb.debian.org/debian bookworm-updates main contrib

# deb [signed-by="/usr/share/keyrings/debian-archive-keyring.gpg"] http://security.debian.org/debian-security bookworm-security main contrib

deb [signed-by="/usr/share/keyrings/kali-archive-keyring.gpg"] https://kali.download/kali kali-rolling main contrib non-free non-free-firmware
" > /etc/apt/sources.list
###
apt update && apt full-upgrade -y

