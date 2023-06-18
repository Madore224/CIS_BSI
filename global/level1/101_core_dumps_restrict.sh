#!/bin/bash

#page 101
echo '[+] Ensure core dumps are restricted'
command=$(dpkg-query -l)
if echo $command | grep -q "coredump"
then
	command=$(systemctl is-enabled coredump.service)
	if echo $command | grep -q -E '^(enabled|disabled|masked)$'
	then
		command1=$(grep -E '^(\*|\s).*hard.*core.*(\s+#.*)?$' /etc/security/limits.conf /etc/security/limits.d/*)
		command2=$(sysctl fs.suid_dumpable)
		command3=$(grep "fs.suid_dumpable" /etc/sysctl.conf /etc/sysctl.d/*)
		if [ ! echo $command | grep -q '* hard core 0' ] || [ ! echo $command | grep -q 'fs.suid_dumpable = 0' ] || [ ! echo $command | grep -q 'fs.suid_dumpable = 0' ]
		then
			echo '* hard core 0' >> /etc/security/limits.conf
			echo 'fs.suid_dumpable = 0' >> /etc/sysctl.conf
			sysctl -w fs.suid_dumpable=0
			if [[ ! -d "/etc/systemd/coredump.conf" ]]
			then
				touch /etc/systemd/coredump.conf
			fi
			echo 'Storage=none' >> /etc/systemd/coredump.conf
			echo 'ProcessSizeMax=0' >> /etc/systemd/coredump.conf
			systemctl daemon-reload
		fi
	fi
else
	echo "[+] Core dump not installed on the system"
fi