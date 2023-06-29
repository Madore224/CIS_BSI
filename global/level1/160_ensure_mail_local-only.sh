#!/bin/bash

#page 101
echo '[+] Ensure mail transfer agent is configured for local-only mode'
command=$(ss -lntu)
if echo $command | grep -q -E ':25\s' | grep -q -E -v '\s(127.0.0.1|::1):25\s'
then
	echo -e "[+] Patching  /etc/exim4/update-exim4.conf.conf"
	diff  /etc/exim4/update-exim4.conf.conf  patch_files/update-exim4.conf.conf > patch.patch
    patch /etc/exim4/update-exim4.conf.conf -i patch.patch > /dev/null 2>&1
    rm patch.patch /dev/null 2>&1
	systemctl restart exim4
fi
