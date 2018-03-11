#!/bin/bash
#: Distro	: arch
#:		: not sure if it works well on other distros
#: Description	: connects wifi interface to a network
iwconfig
echo "enter interface:"
read interface
echo "enter network ESSID: "
read ESSID
echo "enter network password: "
read password
if [ -z "$interface" ] || [ -z "$ESSID" ] || [ -z "$password" ];
then
	echo "fill everything"
	exit 1
fi	
# if network card is down
# ip set link $interface up
echo "$interface"
echo "creating wpa.conf..."
sleep 1
wpa_passphrase $ESSID $password > wpa.conf
echo "done"
echo "connecting..."
wpa_supplicant -B -i $interface -c wpa.conf 
sleep 5 
echo "done"
echo "getting ip..."
dhcpcd
sleep 6
echo "done"
