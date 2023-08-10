# Nethunter Termux for ARM64 only (not ARMHF) 

# Installations;


 - Termux App: https://apkcombo.com/termux/com.termux/download/apk
  
 - VNC kex: https://store.nethunter.com/repo/com.offsec.nethunter.kex_11407306.apk



- Update termux type

       pkg update && pkg upgrade -y
   
- Enable storage access type

       termux-setup-storage

Click allow ...So termux can access your internal storage


- Install wget

       pkg install wget


- Download the Script type 

       wget -O install-nethunter-termux https://offs.ec/2MceZWr

The installer is now downloaded

- Now execute type

       chmod +x install-nethunter-termux

Now you have the permission to run the installer


- Now Install type 

       ./install-nethunter-termux


Note: Only the Full nethunter image support vnc service..
choose #1 and enter...




- After installing;

   type
     
      nh kex password 
      
   ( to configure your vnc password )
  
   type 
       
      nh kex &
      
   ( to enable vnc service )


After, Open VNC and place kali as username and your vnc password 



# Note:
To update and upgrade nethunter it is requires to change /etc/resolv.conf

    sudo echo nameserver 8.8.8.8 >/etc/resolv.conf


 
