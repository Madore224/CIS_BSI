#!/bin/bash

echo -e "[+] Ensure packet redirect sending is disabled"

command1=$(sysctl net.ipv4.conf.all.send_redirects)
command2=$(sysctl net.ipv4.conf.default.send_redirects)
command3=$(grep "net\.ipv4\.conf\.all\.send_redirects" /etc/sysctl.conf /etc/sysctl.d/*)
command4=$(grep "net\.ipv4\.conf\.default\.send_redirects" /etc/sysctl.conf /etc/sysctl.d/*)

if [ ! echo $command1 | grep -q "net.ipv4.conf.all.send_redirects = 0" ] || [ ! echo $command2 | grep -q "net.ipv4.conf.default.send_redirects = 0" ] || [ ! echo $command3 | grep -q "net.ipv4.conf.all.send_redirects = 0" ] || [ ! echo $command4 | grep -q "net.ipv4.conf.default.send_redirects= 0" ]
then
	echo "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.conf
	echo "net.ipv4.conf.default.send_redirects = 0" >> /etc/sysctl.conf
	sysctl -w net.ipv4.conf.all.send_redirects=0
	sysctl -w net.ipv4.conf.default.send_redirects=0
	sysctl -w net.ipv4.conf.default.send_redirects=0
fi
