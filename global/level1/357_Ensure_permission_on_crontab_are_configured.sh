#!/bin/bash

echo "[+] Ensure permission on crontab are configured"

crontab_file="/etc/crontab"
uid_gid_required="0/root"
permissions_required="0"

# Check ownership and permissions of /etc/crontab
file_info=$(stat -c "%U:%G %a" "$crontab_file")

uid_gid=$(echo "$file_info" | cut -d " " -f 1)
permissions=$(echo "$file_info" | cut -d " " -f 2)

# Verify Uid and Gid are both 0/root
if [ "$uid_gid" != "$uid_gid_required" ]; then
  echo ""
  
  # Set ownership to root
  chown root:root "$crontab_file"
  
  echo ""
fi

# Verify permissions do not grant access to group or other
if [ "$permissions" != "$permissions_required" ]; then
  echo ""
  
  # Set permissions to 0
  chmod og-rwx "$crontab_file"
  
  echo ""
fi

