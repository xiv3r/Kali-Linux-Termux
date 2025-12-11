#!/data/data/com.termux/files/usr/bin/bash

cd "$HOME"

# Install required packages
pkg install proot bsdtar libxml2 axel fastfetch -y
clear

# Display system info
fastfetch --logo kali

# Start-up
sed -i '/termux-wake-lock/d' "$PREFIX/etc/bash.bashrc"
sed -i '/clear/d' "$PREFIX/etc/bash.bashrc"
sed -i '/kali -r/d' "$PREFIX/etc/bash.bashrc"
cat >> "$PREFIX/etc/bash.bashrc" << EOF
termux-wake-lock
clear
kali -r
EOF

# Get device architecture
case $(getprop ro.product.cpu.abi) in
    arm64-v8a)
        SYS_ARCH=arm64
        ;;
    armeabi|armeabi-v7a)
        SYS_ARCH=armhf
        ;;
    *)
        echo "[*] Unsupported Architecture!"
        exit 1
        ;;
esac

# Set image strings
echo && echo ""
if [[ ${SYS_ARCH} == "arm64" ]]; then
    echo "[1] Kali NetHunter ARM64 Full"
    echo "[2] Kali NetHunter ARM64 Minimal"
    echo "[3] Kali NetHunter ARM64 Nano"
    read -rp "Select the number to install: " wimg
    echo " "
    case $wimg in
        1) wimg="full" ;;
        2) wimg="minimal" ;;
        3) wimg="nano" ;;
        *) wimg="minimal" ;;
    esac
elif [[ ${SYS_ARCH} == "armhf" ]]; then
    echo "[1] Kali NetHunter ARMhf Full"
    echo "[2] Kali NetHunter ARMhf Minimal"
    echo "[3] Kali NetHunter ARMhf Nano"
    read -rp "Select the number to install: " wimg
    echo " "
    case $wimg in
        1) wimg="full" ;;
        2) wimg="minimal" ;;
        3) wimg="nano" ;;
        *) wimg="minimal" ;;
    esac
fi

####
DIR="kali-${SYS_ARCH}"
IMAGE_NAME="kali-nethunter-rootfs-${wimg}-${SYS_ARCH}.tar.xz"
NM="kali"

# Download Kali rootfs
axel -o "$IMAGE_NAME" "https://kali.download/nethunter-images/current/rootfs/$IMAGE_NAME"

# Check file integrity
echo " "
echo "[*] Checking $NM Linux File Integrity...!!!"
echo " "
echo "[*] MD5"
md5sum "$IMAGE_NAME"
echo " "
echo "[*] SHA256"
sha256sum "$IMAGE_NAME"
echo " "
echo "[*] SHA512"
sha512sum "$IMAGE_NAME"

# Extract rootfs
echo " "
echo "[*] Extracting $IMAGE_NAME, Please wait...!!!"
proot --link2symlink bsdtar -xpJf "$IMAGE_NAME" >/dev/null 2>&1

# Adding shortcut file
cat > "$PREFIX/bin/$NM" <<- EOF
#!/data/data/com.termux/files/usr/bin/bash

cd "$HOME"

## termux-exec sets LD_PRELOAD so let's unset it before continuing
unset LD_PRELOAD

## Workaround for Libreoffice, also needs to bind a fake /proc/version
if [ ! -f $DIR/root/.version ]; then
    touch $DIR/root/.version
fi

## Default user is "kali"
user="$NM"
home="/home/\$user"
start="sudo -u kali /bin/bash"

## NH can be launched as root with the "-r" cmd attribute
## Also check if user kali exists, if not start as root
if grep -q "kali" ${DIR}/etc/passwd; then
    KALIUSR="1";
else
    KALIUSR="0";
fi
if [[ \$KALIUSR == "0" || ("\$#" != "0" && ("\$1" == "-r" || "\$1" == "-R")) ]];then
    user="root"
    home="/\$user"
    start="/bin/bash --login"
    if [[ "\$#" != "0" && ("\$1" == "-r" || "\$1" == "-R") ]];then
        shift
    fi
fi

cmdline="proot \\
        --link2symlink -p \\
        -0 \\
        -r $DIR \\
        -b /dev \\
        -b /proc \\
        -b /sdcard \\
        -b $DIR\$home:/dev/shm \\
        -w \$home \\
           /usr/bin/env -i \\
           HOME=\$home \\
           PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin \\
           TERM=\$TERM \\
           LANG=C.UTF-8 \\
           \$start"

cmd="\$@"
if [ "\$#" == "0" ];then
    exec \$cmdline
else
    \$cmdline -c "\$cmd"
fi
EOF
chmod 755 "$PREFIX/bin/$NM"

# Download and configure vnc
wget -qO "$DIR/bin/vnc" "https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/kali_nethunter/vnc"
chmod 755 "$DIR/bin/vnc"

# Add VNC autostart for full installation
if [ "$wimg" = "full" ]; then
    echo "( kali vnc & )" >> "$PREFIX/etc/bash.bashrc"
fi

# Add uninstallation config file
cat > "$PREFIX/bin/$NM-uninstall" << EOF
#!/data/data/com.termux/files/usr/bin/bash

rm -rf "$HOME/$DIR"
rm -f "$PREFIX/bin/$NM"
sed -i '/termux-wake-lock/d' "$PREFIX/etc/bash.bashrc"
sed -i '/clear/d' "$PREFIX/etc/bash.bashrc"
sed -i '/$NM -r/d' "$PREFIX/etc/bash.bashrc"
sed -i '/( kali vnc & )/d' "$PREFIX/etc/bash.bashrc"
rm -f "$PREFIX/bin/$NM-uninstall"
EOF
chmod 755 "$PREFIX/bin/$NM-uninstall"

# Modify .bash_profile
sed -i '/if/,/fi/d' "$DIR/root/.bash_profile"

# Set SUID for sudo and su
chmod +s "$DIR/usr/bin/sudo"
chmod +s "$DIR/usr/bin/su"

# Fix DNS resolver
cat > "$DIR/etc/resolv.conf" << EOF
nameserver 9.9.9.10
nameserver 8.8.8.8
nameserver 1.1.1.1
EOF

# Fix sudoer file
cat > "$DIR/etc/sudoers.d/$NM" << EOF
$NM    ALL=(ALL:ALL) ALL
EOF

# Neofetch
sed -i '/fastfetch/d' "$DIR/etc/bash.bashrc"
cat >> "$DIR/etc/bash.bashrc" << EOF
sudo apt update
sudo apt install fastfetch -y
sed -i '/sudo apt update/d' "/etc/bash.bashrc"
sed -i '/sudo apt install fastfetch -y/d' "/etc/bash.bashrc"
fastfetch
EOF

# Configure sudo.conf
cat > "$DIR/etc/sudo.conf" << EOF
Set disable_coredump false
EOF

# Modify user and group IDs
USRID=$(id -u)
GRPID=$(id -g)
"$NM" -r usermod -u "$USRID" "$NM" >/dev/null 2>&1
"$NM" -r groupmod -g "$GRPID" "$NM" >/dev/null 2>&1

# Delete Tarball
rm -f "$IMAGE_NAME"
rm -f install.sh

# Display success message
cat << EOF

[*] To Login Kali Nethunter Type: $NM

EOF

bash kali -r
