echo "Installing kMiniRouter..."
path=$(pwd)
auto_script_filename=auto_start_when_boot_kMiniRouter
auto_script_location=/etc/init.d/$auto_script_filename
echo "Now path is: $path"



echo "Create a auto start bash shell"
echo "#!/bin/bash" > $auto_script_location
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> $auto_script_location
echo "iptables -t nat -I POSTROUTING -o ra0 -j MASQUERADE" >> $auto_script_location
echo "iptables -t nat -I POSTROUTING -o wlan0 -j MASQUERADE" >> $auto_script_location
echo "cd $path && node ./index.js > /dev/null 2>&1 &" >> $auto_script_location
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
echo "exit 0" >> $auto_script_location
chmod 0755 $auto_script_location
update-rc.d $auto_script_filename defaults

#install dnsmasq
echo "Install DHCP Server"
apt-get install dnsmasq ifplugd -y 

echo "address=/wifi.arduino.vn/192.168.42.1" >> /etc/dnsmasq.conf
echo "interface=eth0"  >> /etc/dnsmasq.conf
echo "dhcp-range=192.168.42.123,192.168.42.244,12h"  >> /etc/dnsmasq.conf

#install ralink driver
cd driver && make && ./load.sh
