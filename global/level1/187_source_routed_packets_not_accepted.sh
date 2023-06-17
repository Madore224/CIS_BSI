#!/bin/bash

echo -e "[+] Ensure source routed packets are not accepted "

#IPV4
command1=$(sysctl net.ipv4.conf.all.accept_source_route)
command2=$(sysctl net.ipv4.conf.default.accept_source_route)
command3=$(grep "net\.ipv4\.conf\.all\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/*)
command4=$(grep "net\.ipv4\.conf\.default\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/*)

if [ ! echo $command1 | grep -q "net.ipv4.conf.all.accept_source_route = 0" ] || [ ! echo $command2 | grep -q "net.ipv4.conf.default.accept_source_route = 0" ] || [ ! echo $command3 | grep -q "net.ipv4.conf.all.accept_source_route= 0" ] || [ ! echo $command4 | grep -q "net.ipv4.conf.default.accept_source_route= 0" ]
then
	echo "net.ipv4.conf.all.accept_source_route = 0" >>  /etc/sysctl.conf
	echo "net.ipv4.conf.default.accept_source_route = 0" >>  /etc/sysctl.conf
	sysctl -w net.ipv4.conf.all.accept_source_route=0
	sysctl -w net.ipv4.conf.default.accept_source_route=0
	sysctl -w net.ipv4.route.flush=1
fi

#IPV6
command=$(grep "^\s*linux" /boot/grub/grub.cfg | grep -v "ipv6.disable=1")

if ! echo $command | grep -q ""
then
	echo "net.ipv6.conf.all.accept_source_route = 0" >>  /etc/sysctl.conf
	echo "net.ipv6.conf.default.accept_source_route = 0" >>  /etc/sysctl.conf
	sysctl -w net.ipv6.conf.all.accept_source_route=0
	sysctl -w net.ipv6.conf.default.accept_source_route=0
	sysctl -w net.ipv6.route.flush=1
fi