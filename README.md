# <h1 align="center">$${\color{red}Kali-Nethunter-Termux}$$
 </h1>
 
<p align="center">Termux Kali Linux NetHunter is a powerful tool for security professionals and enthusiasts. It allows users to perform a variety of security assessments on their Android devices without rooting them.</p>

<img src="https://github.com/xiv3r/Kali-Linux-Termux/blob/main/kali_nethunter/NHGui.jpg">

<br></br>

# $${\color{magenta}Requirements}$$
- 15GB Storage
- [Termux app](https://f-droid.org/repo/com.termux_1002.apk)
- [Nethunter VNC](https://store.nethunter.com/repo/com.offsec.nethunter.kex_11525001.apk)
<br></br>

# $${\color{magenta}Auto-Install}$$
```diff
-; pkg update && pkg install wget -y && clear && wget -qO install.sh https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/kali_nethunter/install.sh && chmod +x install.sh && bash install.sh && kali
```
### $${\color{magenta}Setup-VNC}$$
> - Setup for Kali Nethunter Full
> - After the installation type the following command in the termux terminal (not the kali)

> - Setup VNC password
```
kali vnc passwd
```
### $${\color{magenta}Run-VNC}$$
> - `127.0.0.1:5901`
```
kali vnc &
```
<details><summary></summary>
<img src="https://github.com/xiv3r/Kali-Linux-Termux/blob/main/kali_nethunter/vncsetup.png">
</details>

> - Next Open the VNC client and add the address `127.0.0.1:5901` and type `kali` as username and your vnc `password`
<br></br>

# $${\color{magenta}Usage}$$
- $${\color{magenta}Login-User}$$
```
kali
```
- $${\color{magenta}Login-Root}$$
```
kali -r
```
- $${\color{magenta}Logout}$$
```
exit
```
- $${\color{magenta}Kill-VNC-service}$$
```
kali kill vnc
```
- $${\color{magenta}Uninstall}$$
```
kali-uninstall
```

# $${\color{magenta}Terminal}$$
> Password: `kali`
<details><summary></summary> 
<img src="https://github.com/xiv3r/Kali-Linux-Termux/blob/main/kali_nethunter/nhterm.png">
</details>

<details><summary>

## $${\color{magenta}Disable-VNC-Phantom-Process-Killer}$$
</summary>
 
> " Process completed (signal 9) - press Enter "
> 
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
