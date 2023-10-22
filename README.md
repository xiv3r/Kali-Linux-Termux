# <h1 align="center"> Nethunter Termux </h1>
 
<p align="center">NetHunter in Termux is a powerful tool for security professionals and enthusiasts. It allows users to perform a variety of security assessments on their Android devices without rooting them.</p>

<br></br>
# Download Apps:
| [Termux App](https://github.com/xiv3r/Termux-Nethunter/releases/download/Apps/Termux_v0.119.1.apk) 
| [VNC Kex App](https://github.com/xiv3r/Termux-Nethunter/releases/download/Apps/offsec.nethunter.kex.apk)
|

<br>

- Update termux

      pkg update && pkg upgrade -y
   
- Enable storage access

      termux-setup-storage


- Install wget

      pkg install wget


- Download the Script

      wget -O install-nethunter-termux https://offs.ec/2MceZWr

  
- Now execute

      chmod 777 install-nethunter-termux


- Install nethunter

      ./install-nethunter-termux


  Note: Only the Full nethunter image support vnc service, choose #1 and hit enter.

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
     
 ## Prevent Termux VNC service from being Killed. " Process completed (signal 9) - press Enter "


- Without PC Using Wireless debugger [VIDEO](https://www.youtube.com/watch?v=vK1Jx9ydi5c)


- Install adb in termux:

      apt install android-tools -y

- Install adb and fastboot in linux and [windows](https://www.androidpolice.com/install-adb-windows-mac-linux-guide/#:~:text=Perform%20a%20manual%20setup%20in%20Windows&text=Download%20the%20SDK%20platform%20tools%20for%20Windows%20from%20the%20Android%20Developers%20website.&text=Open%20a%20command%20window%20in,you%20can%20start%20using%20ADB.):

      apt install adb fastboot -y

  Note: Connect your mobile to the computer then enable [Developer Option](https://www.digitaltrends.com/mobile/how-to-get-developer-options-on-android/) and enable USB Debugging
  
- Now Execute

      adb devices

  Note:Popup and Pair your device  
- Execute the below commands, These commands will disable the phantom process killer:
  
      adb shell "/system/bin/device_config set_sync_disabled_for_tests persistent"

      adb shell "/system/bin/device_config put activity_manager max_phantom_processes 2147483647"
      
      adb shell settings put global settings_enable_monitor_phantom_procs false

- To verify:

      adb shell "/system/bin/dumpsys activity settings | grep max_phantom_processes"

      adb shell "/system/bin/device_config get activity_manager max_phantom_processes"
