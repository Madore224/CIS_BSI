#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 130, 131, 147, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 162, 163, 165, 167, 169, 170, 172, 173, 218
command=$(dpkg-query -l)
for Packages in "xinetd" "openbsd-inetd" "xserver-xorg" "cups" "isc-dhcp-server" "slapd" "nfs-kernel-server" "bind9*" "vsftpd" "apache2" "dovecot-imapd" "dovecot-pop3d" "samba*" "squid" "snmpd" "rsync" "nis" "rsh-client" "talk" "telnet" "ldap-utils" "rpcbind" "iptables-persistent"
do
		echo -e "[+]$green Check if $Packages is installed $endcolor"
        if echo $command | grep -q $Packages
        then
		if [ "$Packages" == "nfs-kernel-server" ]
		then
			echo -e "[+]$green Uninstall rpcbind $endcolor"
			apt -y purge rpcbind > /dev/null 2>&1
		else
            echo -e "[+]$green Uninstall $Packages $endcolor"
			apt -y purge $Packages > /dev/null 2>&1
		fi
	fi
done
