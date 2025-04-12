
# <h1 align="center"> Kali Nethunter Termux </h1>
 
<p align="center">Kali Linux NetHunter on Termux is a powerful tool for security professionals and enthusiasts. It allows users to perform a variety of security assessments on their Android devices without rooting them.</p>

<img src="https://github.com/xiv3r/Kali-Linux-Termux/blob/main/kali_nethunter/kalivnc.jpg">
<br></br>

<h1 align="center">
Download 
 
| [Termux](https://github.com/xiv3r/Kali-Linux-Termux/releases/download/Apps/Termux_v0.119.1.apk)
|
| [VNC](https://github.com/xiv3r/Kali-Linux-Termux/releases/download/Apps/offsec.nethunter.kex.apk)
|
</h1>

<br>

> [!Note]
> - Arm64 only
> - 2GB =>15GB raw file
> - Login for User:`kali`
> - Login for Root:`kali -r`
> - Uninstall:`kali-uninstall`
# Auto Install
```diff
-; apt update && apt install wget -y && wget -qO- https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/kali_nethunter/kali-full | bash && kali
```
Type this command in the termux terminal
> - Setup VNC password
```diff
kali vnc passwd
```        
> - Run VNC service `127.0.0.1:5901`
```diff
kali vnc &
```
<img src="https://github.com/xiv3r/Kali-Linux-Termux/blob/main/kali_nethunter/vncsetup.png">

> Next Open the VNC client and add the address `127.0.0.1:5901` and type `kali` as username and your vnc `password`

<br>

## Terminal
<img src="https://github.com/xiv3r/Kali-Linux-Termux/blob/main/kali_nethunter/kalinh.png">

<details><summary>
 
## Disable phantom process killer
 </summary>
  
## Prevent Termux VNC service from being Killed
> " Process completed (signal 9) - press Enter "

## Download & Install
- Download [Shizuku](https://github.com/RikkaApps/Shizuku/releases) and [Ashell](https://github.com/DP-Hridayan/aShellYou/releases) then enable developer options wireless debugging mode through shizuku and pair the key from the notification
- Permit ashell from shizuku settings 
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

