#--------------------------------------------------
#Softether auto install script
#Centos 7
#Created May 25, 2018
#Latest Softether Server Version for May 2018 v4.27-9667-beta-2018.05.26-tree
#Coded by Jayson Velagio
#Open Source Project From https://www.softether.org/
#From university of Tsukuba, Japan
#--------------------------------------------------
#Login with root permission or execute #sudo su
#Script start
#--------------------------------------------------
#Updating centos version
cd /root
yum update -y
yum groupinstall "development tools" -y
#Downloading server files
yum install wget -y
wget https://www.softether-download.com/files/softether/v4.34-9745-rtm-2020.04.05-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.34-9745-rtm-2020.04.05-linux-x64-64bit.tar.gz
tar zxf softether-vpnserver*
clear
cd vpnserver && chmod 600 * && chmod 700 vpncmd && chmod 700 vpnserver && echo "Giving needed permissions to files in vpnserver/"
ranlib /root/vpnserver/lib/libcharset.a && ranlib /root/vpnserver/lib/libcrypto.a && ranlib /root/vpnserver/lib/libedit.a && ranlib /root/vpnserver/lib/libiconv.a && ranlib /root/vpnserver/lib/libintelaes.a && ranlib /root/vpnserver/lib/libssl.a && ranlib /root/vpnserver/lib/libncurses.a && ranlib /root/vpnserver/lib/libz.a && echo "Ranlib..."
ranlib /root/vpn*/code/vpnserver.a && echo "vpnserver.a"
gcc code/vpnserver.a -O2 -fsigned-char -pthread -m64 -lm -ldl -lrt -lpthread -L./ /root/vpnserver/lib/libssl.a /root/vpnserver/lib/libcrypto.a /root/vpnserver/lib/libiconv.a /root/vpnserver/lib/libcharset.a /root/vpnserver/lib/libedit.a /root/vpnserver/lib/libncurses.a /root/vpnserver/lib/libz.a /root/vpnserver/lib/libintelaes.a -o vpnserver && echo "Compiling vpnserver..."
ranlib /root/vpnserver/code/vpncmd.a && echo "vpncmd.a"
gcc code/vpncmd.a -O2 -fsigned-char -pthread -m64 -lm -ldl -lrt -lpthread -L./ /root/vpnserver/lib/libssl.a /root/vpnserver/lib/libcrypto.a /root/vpnserver/lib/libiconv.a /root/vpnserver/lib/libcharset.a /root/vpnserver/lib/libedit.a /root/vpnserver/lib/libncurses.a /root/vpnserver/lib/libz.a /root/vpnserver/lib/libintelaes.a -o vpncmd && echo "Compiling vpncmd..."
/root/vpnserver/vpncmd /tool /cmd:Check && echo "Check Done, if all passed then the vpn setup should work properly..."cd /root
#Installing server command
wget https://raw.githubusercontent.com/jaysonvelagio/SoftetherAutoInstallMultiPlatform/master/Centos/vpn-server.sh --no-check-certificate
mv vpn-server.sh /etc/init.d/vpnserver
cd /etc/init.d/
chmod 755 vpnserver
chkconfig --add vpnserver
/etc/init.d/vpnserver start
cd /usr/local/vpnserver
#idk if this will work uanefiesgn
cd /root
wget https://www.softether-download.com/files/softether/v4.34-9745-rtm-2020.04.05-tree/Linux/SoftEther_VPN_Client/64bit_-_Intel_x64_or_AMD64/softether-vpnclient-v4.34-9745-rtm-2020.04.05-linux-x64-64bit.tar.gz
tar zxf softether-vpnclient*
clear
cd vpnclient && chmod 600 * && chmod 700 vpncmd && chmod 700 vpnclient && echo "Giving needed permissions to files in vpnclient/"
ranlib lib/libcharset.a && ranlib lib/libcrypto.a && ranlib lib/libedit.a && ranlib lib/libiconv.a && ranlib lib/libintelaes.a && ranlib lib/libncurses.a && ranlib lib/libssl.a && ranlib lib/libz.a && ranlib code/vpnclient.a && echo "Ranlib..."
gcc code/vpnclient.a -O2 -fsigned-char -pthread -m64 -lm -ldl -lrt -lpthread -L./ lib/libssl.a lib/libcrypto.a lib/libiconv.a lib/libcharset.a lib/libedit.a lib/libncurses.a lib/libz.a lib/libintelaes.a -o vpnclient && echo "Compiling vpnclient..."
ranlib code/vpncmd.a && echo "vpncmd.a"
gcc code/vpncmd.a -O2 -fsigned-char -pthread -m64 -lm -ldl -lrt -lpthread -L./ lib/libssl.a lib/libcrypto.a lib/libiconv.a lib/libcharset.a lib/libedit.a lib/libncurses.a lib/libz.a lib/libintelaes.a -o vpncmd && echo "Compiling vpncmd..."
./vpnclient start && echo "Starting vpnclient..."
cd /root/vpnclient/
echo ---------------------------------------------
echo  -e "\033[32;5mVPN SERVER INSTALLED SUCCESSFULLY!\033[0m"
echo "SoftEther auto installer by JAYSON VELAGIO"
echo "vpncmd is at /usr/local/vpnserver"
echo ---------------Commands----------------------
echo /etc/init.d/vpnserver start - to start
echo /etc/init.d/vpnserver restart - to restart
echo /etc/init.d/vpnserver stop - to stop
echo ---------------------------------------------
#End of script
