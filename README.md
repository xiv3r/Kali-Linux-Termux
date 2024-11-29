<p align="center"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fxiv3r%2FKali-Linux-Termux&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=%F0%9F%91%81%EF%B8%8F%F0%9F%91%81%EF%B8%8F&edge_flat=false">

<img width="1100" height="500" src="https://github.com/xiv3r/Kali-Linux-Termux/blob/main/images.jpeg">

# <h1 align="center"> Kali Linux Termux </h1>
 
<p align="center">Kali Linux NetHunter on Termux is a powerful tool for security professionals and enthusiasts. It allows users to perform a variety of security assessments on their Android devices without rooting them.</p>

<br></br>

<h1 align="center">

   [(New stable) KALI in Proot-Distro](https://github.com/xiv3r/proot-distro-kali)
 
   [Termux GUI](https://wiki.termux.com/wiki/Graphical_Environment)
   
| [Termux 0.119.1](https://github.com/xiv3r/Kali-Linux-Termux/releases/download/Apps/Termux_v0.119.1.apk)
|
| [VNC Kex App](https://store.nethunter.com/repo/com.offsec.nethunter.kex_11525001.apk)
|
</h1>

<br>

# Auto Install
> stable on termux v.0.119.1
```sh
termux-setup-storage && apt update && apt upgrade -y && pkg install wget -y && wget -qO- https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/install.sh | sh && sh install-nethunter-termux
```
> [!Note]
> - script include Auto Run Kali on every startup
> - User terminal `nh`
> - Root terminal `nh -r`
> - Only the Full nethunter image support vnc service, choose 1 and hit enter.

- After installing;
> ( to configure your vnc password )
```sh
nh kex password 
```        
> ( to enable vnc service )
```sh
nh kex &
```
- Next Open the VNC and place kali as username and your vnc password 

- Kali main sources.list
```sh
echo "deb http://mirrors.ocf.berkeley.edu/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list
```
 - Autostart kali with vnc
```sh
echo "clear && nh && nh kex &" >> $PREFIX/etc/bash.bashrc
```
<details><summary>
 
 # Kali in Proot-Distro
 </summary>
 
- Auto Install
```sh
apt update && apt upgrade -y && pkg install wget -y && echo "clear && proot-distro login kali" >> $PREFIX/etc/bash.bashrc && wget -qO- https://raw.githubusercontent.com/xiv3r/proot-distro-kali/refs/heads/main/files/setup.sh | sh && proot-distro login kali
```
```sh
apt update && apt install -y wget && wget -O /etc/bash.bashrc https://raw.githubusercontent.com/xiv3r/proot-distro-kali/refs/heads/main/files/bash.bashrc && source /etc/bash.bashrc
```

- Auto login on start-up
```sh
echo "proot-distro login kali" >> $PREFIX/etc/bash.bashrc
```
- Manual login
```sh
proot-distro login kali
```
- Exit
```
exit
```

</details>

<details><summary>
 
 # Kali in Debian Proot-Distro
</summary
 
> - Clear all termux data before installing
> - CLI only
- Auto Install
```sh
termux-setup-storage && apt update && apt upgrade -y && pkg install proot-distro wget -y && echo "proot-distro login debian" >> $PREFIX/etc/bash.bashrc && proot-distro install debian && proot-distro login debian
```
```sh
wget -qO- https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/proot-kali.sh | sh
```
- Auto login on start-up
```sh
echo "proot-distro login debian" >> $PREFIX/etc/bash.bashrc
```
- Manual login
```sh
proot-distro login debian
```
- Exit
```
exit
```
- Set custom terminal username
```sh
sed -i 's/user=kali/user=xiv3r/' /etc/bash.bashrc && source /etc/bash.bashrc
```
</details>

 <h1 align="center">Prevent Termux VNC service from being Killed.</h1> 
 <p align="center"> " Process completed (signal 9) - press Enter " </p>

- Without PC Using Wireless debugger [VIDEO](https://www.youtube.com/watch?v=vK1Jx9ydi5c)

- Install adb in termux:
```sh
apt install android-tools -y
```
- Install adb and fastboot in [linux and windows](https://developer.android.com/tools/adb#:~:text=To%20use%20adb%20with%20a,connect%20your%20device%20with%20USB.):

- Auto Fixed
```sh
curl https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/adb.sh | sudo sh
```
- Maual install 
```sh
apt install adb fastboot -y
```
- Note: Connect your mobile to the computer then enable [Developer Option](https://www.digitaltrends.com/mobile/how-to-get-developer-options-on-android/) and enable USB Debugging
  
- Now Execute
```sh
adb devices
```
Note:Popup and Pair your device  
- Execute the commands below, These commands will disable the phantom process killer:
```sh
adb shell /system/bin/device_config set_sync_disabled_for_tests persistent

adb shell /system/bin/device_config put activity_manager max_phantom_processes 2147483647

adb shell settings put global settings_enable_monitor_phantom_procs false
```
- To verify:
```sh
adb shell /system/bin/dumpsys activity settings | grep max_phantom_processes

adb shell /system/bin/device_config get activity_manager max_phantom_processes
```
