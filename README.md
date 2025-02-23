<p align="center"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fxiv3r%2FKali-Linux-Termux&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=%F0%9F%91%81%EF%B8%8F%F0%9F%91%81%EF%B8%8F&edge_flat=false">

# <h1 align="center"> Kali Nethunter Termux </h1>
 
<p align="center">Kali Linux NetHunter on Termux is a powerful tool for security professionals and enthusiasts. It allows users to perform a variety of security assessments on their Android devices without rooting them.</p>

<img src="https://github.com/xiv3r/Kali-Linux-Termux/blob/main/kali_nethunter/NHK.jpg">
<br></br>

<h1 align="center">
Download 
 
| [Termux](https://github.com/xiv3r/Kali-Linux-Termux/releases/download/Apps/Termux_v0.119.1.apk)
|
| [VNC](https://github.com/xiv3r/Kali-Linux-Termux/releases/download/Apps/offsec.nethunter.kex.apk)
|
</h1>

<br>

# Auto Install
```diff
-; apt update && apt install wget -y && wget -qO- https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/kali_nethunter/kali-full | bash && kali
```
> [!Note]
> - Arm64 only
> - 2GB =>15GB raw file
> - Login for User:`kali`
> - Login for Root:`kali -r`
> - Uninstall:`kali-uninstall`

### Type these command in the termux terminal
> - Setup VNC password
```diff
kali vnc passwd
```        
> - Run VNC service `127.0.0.1:5901`
```diff
kali vnc &
```
> Next Open the VNC and place `kali` as username and your vnc `password`

<img src="https://github.com/xiv3r/Kali-Linux-Termux/blob/main/kali_nethunter/NHK.png">

<details><summary>

</summary>

### Setup custom terminal name
> Replace `xiv3r` to your name
```diff
- ;sed -i 's/user=kali/user=xiv3r/g' .bashrc
```
</details>

 <details><summary>

 </summary>
  
# Prevent Termux VNC service from being Killed
> " Process completed (signal 9) - press Enter "

## Download & Install
- `Shizuku` and `Ashell` then enable wireless debugging through shizuku and pair from the notification
- Permit ashell from shizuku
- Paste the adb commands below on ashell

- Execute the commands below, These commands will disable the phantom process killer:
```diff
adb shell /system/bin/device_config set_sync_disabled_for_tests persistent

adb shell /system/bin/device_config put activity_manager max_phantom_processes 2147483647

adb shell settings put global settings_enable_monitor_phantom_procs false
```
- To verify:
```diff
adb shell /system/bin/dumpsys activity settings | grep max_phantom_processes

adb shell /system/bin/device_config get activity_manager max_phantom_processes
```

</details>

