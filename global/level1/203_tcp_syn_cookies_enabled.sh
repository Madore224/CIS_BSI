#!/bin/bash

echo -e "[+] Ensure TCP SYN Cookies is enabled"

command1=$(sysctl net.ipv4.tcp_syncookies)
command2=$(grep "net\.ipv4\.tcp_syncookies" /etc/sysctl.conf /etc/sysctl.d/*)

if [ ! echo $command1 | grep -q "net.ipv4.tcp_syncookies = 1" ] || [ ! echo $command2 | grep -q "net.ipv4.tcp_syncookies = 1" ]
then
	echo "net.ipv4.tcp_syncookies = 1" >>  /etc/sysctl.conf
	sysctl -w net.ipv4.tcp_syncookies=1
	sysctl -w net.ipv4.route.flush=1
fi