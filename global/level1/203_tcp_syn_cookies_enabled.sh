#!/bin/bash

echo -e "[+] Ensure TCP SYN Cookies is enabled"

command1=$(sysctl net.ipv4.tcp_syncookies)
command2=$(grep "net\.ipv4\.tcp_syncookies" /etc/sysctl.conf /etc/sysctl.d/*)

if [[ $command1 != "net.ipv4.tcp_syncookies = 1" ]] || [[ $command2 != "net.ipv4.tcp_syncookies = 1" ]]
then
	echo "net.ipv4.tcp_syncookies = 1" >>  /etc/sysctl.conf
	sysctl -w net.ipv4.tcp_syncookies=1 > /dev/null 2>&1
	sysctl -w net.ipv4.route.flush=1 > /dev/null 2>&1
fi