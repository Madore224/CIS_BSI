#!/bin/bash

echo -e "[+] Ensure Reverse Path Filtering is enabled"

command1=$(sysctl net.ipv4.conf.all.rp_filter)
command2=$(sysctl net.ipv4.conf.default.rp_filter)
command3=$(grep "net\.ipv4\.conf\.all\.rp_filter" /etc/sysctl.conf /etc/sysctl.d/*)
command4=$(grep "net\.ipv4\.conf\.default\.rp_filter" /etc/sysctl.conf /etc/sysctl.d/*)

if [[ $command1 != "net.ipv4.conf.all.rp_filter = 1" ]] || [[ $command2 != "net.ipv4.conf.default.rp_filter = 1" ]] || [[ $command3 != "net.ipv4.conf.all.rp_filter = 1" ]] || [[ $command4 != "net.ipv4.conf.default.rp_filter = 1" ]]
then
	echo "net.ipv4.conf.all.rp_filter = 1" >>  /etc/sysctl.conf
	echo "net.ipv4.conf.default.rp_filter = 1" >>  /etc/sysctl.conf
	sysctl -w net.ipv4.conf.all.rp_filter=1 > /dev/null 2>&1
	sysctl -w net.ipv4.conf.default.rp_filter=1 > /dev/null 2>&1
	sysctl -w net.ipv4.route.flush=1 > /dev/null 2>&1
fi