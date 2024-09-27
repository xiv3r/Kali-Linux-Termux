<img width="1100" height="500" src="https://github.com/xiv3r/Kali-Linux-Termux/blob/main/images.jpeg">

# <h1 align="center"> Kali Linux Termux </h1>
 
<p align="center">Kali Linux NetHunter on Termux is a powerful tool for security professionals and enthusiasts. It allows users to perform a variety of security assessments on their Android devices without rooting them.</p>

<br></br>

<h1 align="center">
  
   [Termux GUI](https://wiki.termux.com/wiki/Graphical_Environment)
   
| [Termux App](https://github.com/xiv3r/Termux-Nethunter/releases/download/Apps/Termux_v0.119.1.apk) 
| [VNC Kex App](https://github.com/xiv3r/Termux-Nethunter/releases/download/Apps/offsec.nethunter.kex.apk)
|
</h1>

<br>

- Auto Install

      apt install curl -y ; curl https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/install.sh | sh

 * Note: Only the Full nethunter image support vnc service, choose 1 and hit enter.

- After installing;
      
   ( to configure your vnc password )

      nh kex password 
             
   ( to enable vnc service )

      nh kex &

- Next Open the VNC and place kali as username and your vnc password 


  Note:To update and upgrade nethunter it is required to change nameserver from /etc/resolv.conf

      sudo echo nameserver 8.8.8.8 >/etc/resolv.conf

  or use

      nano /etc/resov.conf
  
  and add

      nameserver 8.8.8.8
      nameserver 1.1.1.1

 - Automatically launch Nethunter NH command after opening the termux

       nano $PREFIX/etc/bash.bashrc

   add

       nh
       nh kex &

     
 ### <h1 align="center">Prevent Termux VNC service from being Killed.</h1> 
 <p align="center"> " Process completed (signal 9) - press Enter " </p>


- Without PC Using Wireless debugger [VIDEO](https://www.youtube.com/watch?v=vK1Jx9ydi5c)


- Install adb in termux:

      apt install android-tools -y

- Install adb and fastboot in [linux and windows](https://developer.android.com/tools/adb#:~:text=To%20use%20adb%20with%20a,connect%20your%20device%20with%20USB.):

      apt install adb fastboot -y

  Note: Connect your mobile to the computer then enable [Developer Option](https://www.digitaltrends.com/mobile/how-to-get-developer-options-on-android/) and enable USB Debugging
  
- Now Execute

      adb devices

  Note:Popup and Pair your device  
- Execute the below commands, These commands will disable the phantom process killer:
  
      adb shell /system/bin/device_config set_sync_disabled_for_tests persistent

      adb shell /system/bin/device_config put activity_manager max_phantom_processes 2147483647
      
      adb shell settings put global settings_enable_monitor_phantom_procs false

- To verify:

      adb shell /system/bin/dumpsys activity settings | grep max_phantom_processes

      adb shell /system/bin/device_config get activity_manager max_phantom_processes
