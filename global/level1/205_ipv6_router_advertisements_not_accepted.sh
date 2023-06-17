#!/bin/bash

echo -e "[+] Ensure IPv6 router advertisements are not accepted "

command=$(grep "^\s*linux" /boot/grub/grub.cfg | grep -v "ipv6.disable=1")

if ! echo $command | grep -q ""
then
	echo "net.ipv6.conf.all.accept_ra = 0" >>  /etc/sysctl.conf
	echo "net.ipv6.conf.default.accept_ra = 0" >>  /etc/sysctl.conf
	sysctl -w net.ipv6.conf.all.accept_ra=0
	sysctl -w net.ipv6.conf.default.accept_ra=0
	sysctl -w net.ipv6.route.flush=1
fi