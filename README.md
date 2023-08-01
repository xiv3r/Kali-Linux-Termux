# Nethunter Termux Installations;


  Termux App: https://apkcombo.com/termux/com.termux/download/apk
  
  VNC kex: https://store.nethunter.com/repo/com.offsec.nethunter.kex_11407306.apk



1) Open termux and type

       pkg update && pkg upgrade -y
   
2) Open Termux and type

       termux-setup-storage

Click allow ...So termux can access your internal storage


3) Now type 

       pkg install wget

wget tool helps in downloading files from internet in linux environment


4) Now type 

       wget -O install-nethunter-termux https://offs.ec/2MceZWr

The installer is now downloaded


5) Now type

       chmod +x install-nethunter-termux

Now you have the permission to run the installer


6) Now type 

       ./nstall-nethunter-termux


Note: Only the Full nethunter image support vnc service..
choose #1 and enter...




After installing;

   type
     
      nh kex password 
      
   ( to configure your vnc password )
  
   type 
       
      nh kex &
      
   ( to enable vnc service )


Next is Open VNC and place kali as username and your vnc password 



# Note:
To update and upgrade nethunter it is required changing /etc/resolv.conf

    sudo echo nameserver 8.8.8.8 >/etc/resolv.conf


 
