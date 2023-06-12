#!/bin/bash

echo "[+] Enable process auditd..."

#!/bin/bash

sed -i '/GRUB_CMDLINE_LINUX="/d' /etc/default/grub

echo 'GRUB_CMDLINE_LINUX="ipv6.disable=1 audit=1 find_preseed=/preseed.cfg auto no prompt priority=critical locale=en_US"' >> /etc/default/grub

update-grub >/dev/null 2>&1
