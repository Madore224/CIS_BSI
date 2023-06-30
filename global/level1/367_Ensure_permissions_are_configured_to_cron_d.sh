#!/bin/bash

echo "[+] Ensure permission are configured to cron.d"

cron_d_dir="/etc/cron.d"
uid_gid_required="0/root"
permissions_required="0"

# Check ownership and permissions of /etc/cron.d directory
dir_info=$(stat -c "%U:%G %a" "$cron_d_dir")

uid_gid=$(echo "$dir_info" | cut -d " " -f 1)
permissions=$(echo "$dir_info" | cut -d " " -f 2)

# Verify Uid and Gid are both 0/root
if [ "$uid_gid" != "$uid_gid_required" ]; then
  echo ""

  # Set ownership to root
  chown root:root "$cron_d_dir"

  echo ""
fi

# Verify permissions do not grant access to group or other
if [ "$permissions" != "$permissions_required" ]; then
  echo ""

  # Set permissions to 0
  chmod og-rwx "$cron_d_dir"

  echo ""
fi

