# kMiniRouter

Install hostapd

apt-get install hostapd

Edit /etc/default/hostapd, enter:
# vi /etc/default/hostapd

Uncomment and set DAEMON_CONF to the absolute path of a hostapd configuration file and hostapd will be started during system boot:

DAEMON_CONF="/etc/hostapd/hostapd.conf"