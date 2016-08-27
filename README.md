# Về kMiniRouter

Đây là project giúp bạn dễ dàng tiếp cận với thế giới IOT, nó sẽ giúp bạn cài một máy tính nhúng (trong trường hợp thử nghiệm là orange pi one) trở thành một mini client!

# Yêu càu 
+ nodejs 0.12 trở lên
+ USB Wifi sử dụng chíp RALink

# Cài đặt

Chép đoạn này vào /etc/network/interfaces


	allow-hotplug eth0
	iface eth0 inet static
			address 192.168.42.1
			netmask 255.255.255.0

	auto lo
	iface lo inet loopback

	auto wlan0
	iface wlan0 inet dhcp
			wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf

	auto ra0
	allow-hotplug ra0
	iface ra0 inet dhcp
			wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf


Rồi clone project này về, sau đó cài hoy

	git clone https://github.com/ngohuynhngockhanh/kMiniRouter

	cd kMiniRouter
	./setup.sh

	init 6 #để khởi động lại


# Sử dụng
Truy cập vào http://wifi.arduino.vn để setup mạng LAN!