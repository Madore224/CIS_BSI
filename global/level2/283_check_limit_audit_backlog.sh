#!/bin/bash

#!/bin/bash

echo "[+] Check limit of audit backlog..."

sed -i '/GRUB_CMDLINE_LINUX="/d' /etc/default/grub

echo 'GRUB_CMDLINE_LINUX="ipv6.disable=1 audit=1 audit_backlog_limit=8192 find_preseed=/preseed.cfg auto no prompt priority=critical locale=en_US"' >> /etc/default/grub

update-grub >/dev/null 2>&1
