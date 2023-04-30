#!/bin/bash

echo -e "Disable IPV6"

sed -i '/GRUB_CMDLINE_LINUX="/d' /etc/default/grub

echo 'GRUB_CMDLINE_LINUX="ipv6.disable=1 find_preseed=/preseed.cfg auto no prompt priority=critical locale=en_US"' >> /etc/default/grub

update-grub