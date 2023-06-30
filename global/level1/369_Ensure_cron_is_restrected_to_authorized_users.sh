#!/bin/sh

echo "[+] Ensure cron is restrected to authorized users"

cron_deny_file="/etc/cron.deny"
cron_allow_file="/etc/cron.allow"
uid_gid_required="0/root"
permissions_required="600"

# Check if /etc/cron.deny exists
if [ -e "$cron_deny_file" ]; then
  echo ""
  rm "$cron_deny_file"
  echo ""
fi

# Check ownership and permissions of /etc/cron.allow
if [ -e "$cron_allow_file" ]; then
  file_info=$(stat -c "%U:%G %a" "$cron_allow_file")
  
  uid_gid=$(echo "$file_info" | cut -d " " -f 1)
  permissions=$(echo "$file_info" | cut -d " " -f 2)

  # Verify Uid and Gid are both 0/root
  if [ "$uid_gid" != "$uid_gid_required" ]; then
    echo ""
    chown root:root "$cron_allow_file"
    echo ""
  fi

  # Verify permissions do not grant write or execute to group or permissions to other
  if [ "$permissions" != "$permissions_required" ]; then
    echo ""
    chmod 600 "$cron_allow_file"
    echo ""
  fi
else
  echo ""
  touch "$cron_allow_file"
  echo ""
  chmod 600 "$cron_allow_file"
  chown root:root "$cron_allow_file"
  echo ""
fi

