#!/bin/bash

echo -e "[+] Ensure Reverse Path Filtering is enabled"

command1=$(sysctl net.ipv4.conf.all.rp_filter)
command2=$(sysctl net.ipv4.conf.default.rp_filter)
command3=$(grep "net\.ipv4\.conf\.all\.rp_filter" /etc/sysctl.conf /etc/sysctl.d/*)
command4=$(grep "net\.ipv4\.conf\.default\.rp_filter" /etc/sysctl.conf /etc/sysctl.d/*)

if [ ! echo $command1 | grep -q "net.ipv4.conf.all.rp_filter = 1" ] || [ ! echo $command2 | grep -q "net.ipv4.conf.default.rp_filter = 1" ] || [ ! echo $command3 | grep -q "net.ipv4.conf.all.rp_filter = 1" ] || [ ! echo $command4 | grep -q "net.ipv4.conf.default.rp_filter = 1" ]
then
	echo "net.ipv4.conf.all.rp_filter = 1" >>  /etc/sysctl.conf
	echo "net.ipv4.conf.default.rp_filter = 1" >>  /etc/sysctl.conf
	sysctl -w net.ipv4.conf.all.rp_filter=1
	sysctl -w net.ipv4.conf.default.rp_filter=1
	sysctl -w net.ipv4.route.flush=1
fi