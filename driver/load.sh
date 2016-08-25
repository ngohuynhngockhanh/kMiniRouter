#dmesg -c
rm -rf /etc/Wireless/RT2870STA/
mkdir /etc/Wireless/RT2870STA/
cp ./MODULE/conf/RT2870STA.dat /etc/Wireless/RT2870STA/RT2870STA.dat
chmod 777 -R /etc/Wireless/RT2870STA
insmod UTIL/os/linux/mtutil7601Usta.ko
insmod MODULE/os/linux/mt7601Usta.ko
insmod NETIF/os/linux/mtnet7601Usta.ko
lsmod | grep "mt7601"
ifconfig ra0 up
