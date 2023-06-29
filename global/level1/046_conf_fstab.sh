#!/bin/bash

#page 46 to 50
echo -e "[+] Ensure /dev/shm is configured"
if [ "$(mount | grep -E '\s/dev/shm\s')" != "tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev,noexec,relatime,seclabel)" ]
then
	if [ "$(grep -E '\s/dev/shm\s' /etc/fstab)" = "" ]
	then
		echo -e "[+] Configure /dev/shm into /etc/fstab"
		echo "tmpfs /dev/shm tmpfs defaults,noexec,nodev,nosuid,seclabel 0 0" >> /etc/fstab
		mount -o remount,noexec,nodev,nosuid /dev/shm
	fi
fi
