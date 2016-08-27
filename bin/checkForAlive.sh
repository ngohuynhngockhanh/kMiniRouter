#!/bin/bash 


DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
process="index.js"

iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE
iptables -t nat -I POSTROUTING -o ra0 -j MASQUERADE
iptables -t nat -I POSTROUTING -o wlan0 -j MASQUERADE

while true;
do
	if ps | grep -v grep | grep $process > /dev/null         
	then                 
		echo "Process $process is running"         
	else        
		echo "Start kMiniRouter again"
		cd $DIR && cd ../ && node ./index.js
	fi
	sleep 10
done