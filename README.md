# <h1 align="center"> Nethunter Termux </h1>
 
<p align="center">NetHunter in Termux is a powerful tool for security professionals and enthusiasts. It allows users to perform a variety of security assessments on their Android devices without rooting them.</p>

<br></br>
# Download Apps:
| [Termux App](https://github.com/xiv3r/Termux-Nethunter/releases/download/Apps/Termux_v0.119.1.apk) 
| [VNC Kex App](https://github.com/xiv3r/Termux-Nethunter/releases/download/Apps/offsec.nethunter.kex.apk)
|


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

Note:

To update and upgrade nethunter it is required to change /etc/resolv.conf

      sudo echo nameserver 8.8.8.8 >/etc/resolv.conf


 
