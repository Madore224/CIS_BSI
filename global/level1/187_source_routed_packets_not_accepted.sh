#!/bin/bash

echo -e "[+] Ensure source routed packets are not accepted "

#IPV4
command1=$(sysctl net.ipv4.conf.all.accept_source_route)
command2=$(sysctl net.ipv4.conf.default.accept_source_route)
command3=$(grep "net\.ipv4\.conf\.all\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/*)
command4=$(grep "net\.ipv4\.conf\.default\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/*)

if [[ $command1 != "net.ipv4.conf.all.accept_source_route = 0" ]] || [[ $command2 != "net.ipv4.conf.default.accept_source_route = 0" ]] || [[ $command3 != "net.ipv4.conf.all.accept_source_route= 0" ]] || [[ $command4 != "net.ipv4.conf.default.accept_source_route= 0" ]]
then
	echo "net.ipv4.conf.all.accept_source_route = 0" >>  /etc/sysctl.conf
	echo "net.ipv4.conf.default.accept_source_route = 0" >>  /etc/sysctl.conf
	sysctl -w net.ipv4.conf.all.accept_source_route=0 > /dev/null 2>&1
	sysctl -w net.ipv4.conf.default.accept_source_route=0 > /dev/null 2>&1
	sysctl -w net.ipv4.route.flush=1 > /dev/null 2>&1
fi

#IPV6
command=$(grep "^\s*linux" /boot/grub/grub.cfg | grep -v "ipv6.disable=1")

if ! echo $command | grep -q ""
then
	echo "net.ipv6.conf.all.accept_source_route = 0" >>  /etc/sysctl.conf
	echo "net.ipv6.conf.default.accept_source_route = 0" >>  /etc/sysctl.conf
	sysctl -w net.ipv6.conf.all.accept_source_route=0 > /dev/null 2>&1
	sysctl -w net.ipv6.conf.default.accept_source_route=0 > /dev/null 2>&1
	sysctl -w net.ipv6.route.flush=1 > /dev/null 2>&1
fi