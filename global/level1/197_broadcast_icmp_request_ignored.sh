#!/bin/bash

echo -e "[+]  Ensure broadcast ICMP requests are ignored"

command1=$(sysctl net.ipv4.icmp_echo_ignore_broadcasts)
command2=$(grep "net\.ipv4\.icmp_echo_ignore_broadcasts" /etc/sysctl.conf /etc/sysctl.d/*)

if [[ $command1 != "net.ipv4.icmp_echo_ignore_broadcasts = 1" ]] || [[ $command2 != "net.ipv4.icmp_echo_ignore_broadcasts = 1" ]]
then
	echo "net.ipv4.icmp_echo_ignore_broadcasts = 1" >>  /etc/sysctl.conf
	sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1 > /dev/null 2>&1
	sysctl -w net.ipv4.route.flush=1 > /dev/null 2>&1
fi