#!/bin/bash

echo "[+] Disable IPV6..."

if ! grep "^\s*linux" /boot/grub/grub.cfg | grep -v "ipv6.disable=1" >/dev/null; then
	echo "[+]"
else
    	sed -i '/GRUB_CMDLINE_LINUX="/d' /etc/default/grub

	echo 'GRUB_CMDLINE_LINUX="ipv6.disable=1 find_preseed=/preseed.cfg auto no prompt priority=critical locale=en_US"' >> /etc/default/grub

	update-grub >/dev/null 2>&1
fi