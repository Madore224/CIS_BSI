#!/bin/bash

#page 130, 131, 147, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 162, 163, 165, 167, 169, 170, 172, 173, 218
command=$(dpkg-query -l)
for Packages in "xinetd" "openbsd-inetd" "xserver-xorg" "cups" "isc-dhcp-server" "slapd" "nfs-kernel-server" "bind9*" "vsftpd" "apache2" "dovecot-imapd" "dovecot-pop3d" "samba*" "squid" "snmpd" "rsync" "nis" "rsh-client" "talk" "telnet" "ldap-utils" "rpcbind" "iptables-persistent"
do
		echo -e "[+] Check if $Packages is installed "
        if echo $command | grep -q $Packages
        then
		if [ "$Packages" == "nfs-kernel-server" ]
		then
			echo -e "[+] Uninstall rpcbind "
			apt -y purge rpcbind > /dev/null 2>&1
		else
            echo -e "[+] Uninstall $Packages "
			apt -y purge $Packages > /dev/null 2>&1
		fi
	fi
done
