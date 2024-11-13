<img width="1100" height="500" src="https://github.com/xiv3r/Kali-Linux-Termux/blob/main/images.jpeg">

# <h1 align="center"> Kali Linux Termux </h1>
 
<p align="center">Kali Linux NetHunter on Termux is a powerful tool for security professionals and enthusiasts. It allows users to perform a variety of security assessments on their Android devices without rooting them.</p>

<br></br>

<h1 align="center">
  
   [Termux GUI](https://wiki.termux.com/wiki/Graphical_Environment)
   
| [Termux 0.119.1](https://objects.githubusercontent.com/github-production-release-asset-2e65be/672795302/c3bf54c6-4730-45f0-b9bd-310edb5d9558?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20241113%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20241113T072447Z&X-Amz-Expires=300&X-Amz-Signature=ba650d6fb12a1fe2dd109d954032720d5402b1d406de689aa6140325a423a2a9&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3DTermux_v0.119.1.apk&response-content-type=application%2Fvnd.android.package-archive) 
|
| [VNC Kex App](https://store.nethunter.com/repo/com.offsec.nethunter.kex_11525001.apk)
|
</h1>

<br>

- Auto Install
> stable on termux v.0.119.1

      termux-setup-storage && apt update && apt upgrade -y && pkg install wget -y && wget -qO- https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/install.sh | sh && sh install-nethunter-termux

> [!Note]
>> script include Auto Run Kali on every startup
> 
>> User terminal `nh`
> 
>> Root terminal `nh -r`
> 
>> Only the Full nethunter image support vnc service, choose 1 and hit enter.

- After installing;
      
   ( to configure your vnc password )

      nh kex password 
             
   ( to enable vnc service )

      nh kex &

- Next Open the VNC and place kali as username and your vnc password 


- Kali main sources.list

      echo "deb http://mirrors.ocf.berkeley.edu/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list

 - Autostart kali with vnc
 
       echo "clear ; nh ; nh kex &" >> $PREFIX/etc/bash.bashrc
   
     
 ### <h1 align="center">Prevent Termux VNC service from being Killed.</h1> 
 <p align="center"> " Process completed (signal 9) - press Enter " </p>


- Without PC Using Wireless debugger [VIDEO](https://www.youtube.com/watch?v=vK1Jx9ydi5c)


- Install adb in termux:

      apt install android-tools -y

- Install adb and fastboot in [linux and windows](https://developer.android.com/tools/adb#:~:text=To%20use%20adb%20with%20a,connect%20your%20device%20with%20USB.):

- Auto Fixed

      curl https://raw.githubusercontent.com/xiv3r/Kali-Linux-Termux/refs/heads/main/adb.sh | sudo sh

- Maual install 

      apt install adb fastboot -y

  Note: Connect your mobile to the computer then enable [Developer Option](https://www.digitaltrends.com/mobile/how-to-get-developer-options-on-android/) and enable USB Debugging
  
- Now Execute

      adb devices

  Note:Popup and Pair your device  
- Execute the commands below, These commands will disable the phantom process killer:
  
      adb shell /system/bin/device_config set_sync_disabled_for_tests persistent

      adb shell /system/bin/device_config put activity_manager max_phantom_processes 2147483647
      
      adb shell settings put global settings_enable_monitor_phantom_procs false

- To verify:

      adb shell /system/bin/dumpsys activity settings | grep max_phantom_processes

      adb shell /system/bin/device_config get activity_manager max_phantom_processes
