# Nethunter Termux for ARM64 only (not ARMHF) 

- Download Apps:
# [Termux App](https://apkcombo.com/termux/com.termux/download/apk)  
# [VNC kex App](https://store.nethunter.com/repo/com.offsec.nethunter.kex_11407306.apk)



- Update termux

       pkg update && pkg upgrade -y
   
- Enable storage access

       termux-setup-storage


- Install wget

       pkg install wget


- Download the Script

       wget -O install-nethunter-termux https://offs.ec/2MceZWr

The installer is now downloaded

- Now execute

       chmod 777 install-nethunter-termux

you have the permission to run the installer


- Install nethunter

       ./install-nethunter-termux


- Note: Only the Full nethunter image support vnc service, choose #1 and hit enter.




- After installing;
     
      nh kex password 
      
   ( to configure your vnc password )
       
      nh kex &
      
   ( to enable vnc service )


- Next Open the VNC and place kali as username and your vnc password 


# Note:
To update and upgrade nethunter it is required to change /etc/resolv.conf

      sudo echo nameserver 8.8.8.8 >/etc/resolv.conf


 
