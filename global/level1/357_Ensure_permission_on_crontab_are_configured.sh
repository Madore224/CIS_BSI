#!/bin/bash

crontab_file="/etc/crontab"
uid_gid_required="0/root"
permissions_required="0"

# Check ownership and permissions of /etc/crontab
file_info=$(stat -c "%U:%G %a" "$crontab_file")

uid_gid=$(echo "$file_info" | cut -d " " -f 1)
permissions=$(echo "$file_info" | cut -d " " -f 2)

# Verify Uid and Gid are both 0/root
if [ "$uid_gid" != "$uid_gid_required" ]; then
  echo "Uid and Gid for $crontab_file should be $uid_gid_required. Setting ownership..."
  
  # Set ownership to root
  chown root:root "$crontab_file"
  
  echo "Ownership for $crontab_file has been set to $uid_gid_required."
fi

# Verify permissions do not grant access to group or other
if [ "$permissions" != "$permissions_required" ]; then
  echo "Permissions for $crontab_file should be $permissions_required. Setting permissions..."
  
  # Set permissions to 0
  chmod og-rwx "$crontab_file"
  
  echo "Permissions for $crontab_file have been set to $permissions_required."
fi

