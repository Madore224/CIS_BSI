#!/bin/bash

green="\033[32m"
red="\033[31m"
endcolor="\033[0m\n"

#page 46 to 50
echo -e "[+]$green Ensure /dev/shm is configured $endcolor"
if [ "$(mount | grep -E '\s/dev/shm\s')" != "tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev,noexec,relatime,seclabel)" ]
then
	if [ "$(grep -E '\s/dev/shm\s' /etc/fstab)" = "" ]
	then
		echo -e "[+]$green Configure /dev/shm into /etc/fstab $endcolor"
		echo "tmpfs /dev/shm tmpfs defaults,noexec,nodev,nosuid,seclabel 0 0" >> /etc/fstab
		mount -o remount,noexec,nodev,nosuid /dev/shm
	fi
fi
