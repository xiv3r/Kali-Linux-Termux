#!/data/data/com.termux/files/usr/bin/bash

# Install required packages
apt install proot bsdtar libxml2 axel neofetch -y
clear

cd $HOME

### Set variables
TAR=kali-rootfs-full-arm64.tar.xz
DIR=kali-arm64
NM=kali

# Display system info
neofetch --ascii_distro Kali

# Download Kali rootfs
axel -o $TAR https://kali.download/nethunter-images/current/rootfs/kali-nethunter-rootfs-full-arm64.tar.xz

# Check file integrity
echo " "
echo "Checking $TAR File Integrity!"
sleep 3s
echo " "
echo "[*] MD5"
md5sum $TAR
echo " "
echo "[*] SHA256"
sha256sum $TAR
echo " "
echo "[*] SHA512"
sha512sum $TAR

# Extract rootfs
echo " "
echo "[*] Decompressing 14GB of files takes 15-20 minutes...!!!"
echo " "
echo "[*] Extracting $TAR...!!!"
proot --link2symlink bsdtar -xpJf $TAR 2>/dev/null

# Update bash.bashrc
cat >> $PREFIX/etc/bash.bashrc << EOF
clear
($NM vnc) &
$NM
EOF

# Download and configure scripts
wget -O $DIR/bin/vnc https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/kali_nethunter/vnc
chmod 700 $DIR/bin/vnc

# Adding shortcut file
wget -O $PREFIX/bin/$NM https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/kali_nethunter/kali
chmod 700 $PREFIX/bin/$NM

# Add neofetch
wget -O $DIR/bin/neofetch https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/kali_nethunter/neofetch
chmod 700 $DIR/bin/neofetch

# Add uninstallation config file
cat > $PREFIX/bin/$NM-uninstall << EOF
rm -rf $HOME/$DIR
rm -rf $PREFIX/bin/$NM
sed -i 's/clear//g' $PREFIX/etc/bash.bashrc
sed -i 's/($NM vnc) &//g' $PREFIX/etc/bash.bashrc
sed -i 's/$NM//g' $PREFIX/etc/bash.bashrc
rm -rf $PREFIX/bin/$NM-uninstall
EOF
chmod 755 $PREFIX/bin/$NM-uninstall

# Modify .bash_profile
sed -i '/if/,/fi/d' $DIR/root/.bash_profile

# Set SUID for sudo and su
chmod +s $DIR/bin/sudo
chmod +s $DIR/bin/su

# Fix DNS issue
cat > $DIR/etc/resolv.conf << EOF
nameserver 9.9.9.10
EOF

# Fix sudoer file
cat > $DIR/etc/sudoers.d/$NM << EOF
$NM    ALL=(ALL:ALL) ALL
EOF

# Update bash.bashrc inside chroot
cat >> $DIR/etc/bash.bashrc << EOF
neofetch
EOF

# Configure sudo.conf
cat > $DIR/etc/sudo.conf << EOF
Set disable_coredump false
EOF

# Modify user and group IDs
USRID=$(id -u)
GRPID=$(id -g)
$NM -r usermod -u $USRID $NM 2>/dev/null
$NM -r groupmod -g $GRPID $NM 2>/dev/null

# Delete tarball
rm $TAR

# Display success message
cat << EOF
[*] Successful Installation...!
[*] To Configure VNC password

[*] Type: kali vnc passwd
[*] Type: kali vnc &
EOF

