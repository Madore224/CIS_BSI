#!/bin/bash

echo -e "[+] Ensure packet redirect sending is disabled"

command1=$(sysctl net.ipv4.conf.all.send_redirects)
command2=$(sysctl net.ipv4.conf.default.send_redirects)
command3=$(grep "net\.ipv4\.conf\.all\.send_redirects" /etc/sysctl.conf /etc/sysctl.d/*)
command4=$(grep "net\.ipv4\.conf\.default\.send_redirects" /etc/sysctl.conf /etc/sysctl.d/*)

if [[ $command1 != "net.ipv4.conf.all.send_redirects = 0" ]] || [[ $command2 != "net.ipv4.conf.default.send_redirects = 0" ]] || [[ $command3 != "net.ipv4.conf.all.send_redirects = 0" ]] || [[ $command4 != "net.ipv4.conf.default.send_redirects= 0" ]]
then
	echo "net.ipv4.conf.all.send_redirects = 0" >> /etc/sysctl.conf
	echo "net.ipv4.conf.default.send_redirects = 0" >> /etc/sysctl.conf
	sysctl -w net.ipv4.conf.all.send_redirects=0 > /dev/null 2>&1
	sysctl -w net.ipv4.conf.default.send_redirects=0 > /dev/null 2>&1 
	sysctl -w net.ipv4.conf.default.send_redirects=0 > /dev/null 2>&1
fi
