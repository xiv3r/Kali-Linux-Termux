# <h1 align="center">Kali Nethunter Termux</h1>
 
<p align="center">Termux Kali Linux NetHunter is a powerful tool for security professionals and enthusiasts. It allows users to perform a variety of security assessments on their Android devices without rooting them.</p>

<img src="https://github.com/xiv3r/Kali-Linux-Termux/blob/main/kali_nethunter/NHGui.jpg">

<br>

# Requirements
- Arm64
- Armhf
 ```
getprop ro.product.cpu.abi
```
- 15GB Storage
- [Termux app](https://f-droid.org/repo/com.termux_1002.apk)
- [Nethunter VNC](https://store.nethunter.com/repo/com.offsec.nethunter.kex_11525001.apk)

# Auto Install
- ## Kali Nethunter Full VNC - arm64
> 2.1GB tarball
```
pkg update && pkg install wget -y && clear && wget -qO- https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/kali_nethunter/arm64-full | bash && kali
```
- ## Kali Nethunter Minimal - arm64
> 131MB tarball Without VNC
```
pkg update && pkg install wget -y && clear && wget -qO- https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/kali_nethunter/arm64-minimal | bash && kali
```
- ## Kali Nethunter Full VNC - armhf
> 2GB tarball
```
pkg update && pkg install wget -y && clear && wget -qO- https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/kali_nethunter/armhf-full | bash && kali
```
- ## Kali Nethunter Full Minimal - armhf
> 122MB tarball without VNC
```
pkg update && pkg install wget -y && clear && wget -qO- https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/kali_nethunter/armhf-minimal | bash && kali
```
# Setup VNC
> - Setup for Kali Nethunter Full "arm64" and "armhf"
> - After the installation type the following command in the termux terminal (not the kali)

> - Setup VNC password
```
kali vnc passwd
```        
> - Run VNC service `127.0.0.1:5901`
```
kali vnc &
```
<details><summary></summary>
<img src="https://github.com/xiv3r/Kali-Linux-Termux/blob/main/kali_nethunter/vncsetup.png">
</details>

> Next Open the VNC client and add the address `127.0.0.1:5901` and type `kali` as username and your vnc `password`

# Termux
Login User
```
kali
```
Login Root
```
kali -r
```
Logout
```
exit
```
Kill VNC service
```
kali kill vnc
```
Uninstall
```
kali-uninstall
```
<br><br>

# Terminal
> Password: `kali`

<img src="https://github.com/xiv3r/Kali-Linux-Termux/blob/main/kali_nethunter/nhterm.png">


<details><summary>

# Disable VNC Phantom Process Killer
 </summary>
 
> " Process completed (signal 9) - press Enter "

## Download & Install
- Download [Shizuku](https://github.com/RikkaApps/Shizuku/releases) and [Ashell](https://github.com/DP-Hridayan/aShellYou/releases) then enable developer options wireless debugging mode through shizuku and pair the key from the notification
- Permit ashell from shizuku settings 
- Paste the adb commands below on ashell

- Execute the commands below, These commands will disable the phantom process killer:
```
adb shell /system/bin/device_config set_sync_disabled_for_tests persistent
```
```
adb shell /system/bin/device_config put activity_manager max_phantom_processes 2147483647
```
```
adb shell settings put global settings_enable_monitor_phantom_procs false
```
- To verify:
```
adb shell /system/bin/dumpsys activity settings | grep max_phantom_processes
```
```
adb shell /system/bin/device_config get activity_manager max_phantom_processes
```
</details>

# [Common Issues](https://github.com/xiv3r/Kali-Linux-Termux/issues?q=is%3Aissue%20state%3Aclosed)
