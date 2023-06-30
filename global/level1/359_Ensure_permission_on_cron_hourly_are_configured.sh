#!/bin/bash

cron_hourly_dir="/etc/cron.hourly"
uid_gid_required="0/root"
permissions_required="0"

# Check ownership and permissions of /etc/cron.hourly directory
dir_info=$(stat -c "%U:%G %a" "$cron_hourly_dir")

uid_gid=$(echo "$dir_info" | cut -d " " -f 1)
permissions=$(echo "$dir_info" | cut -d " " -f 2)

# Verify Uid and Gid are both 0/root
if [ "$uid_gid" != "$uid_gid_required" ]; then
  echo "Uid and Gid for $cron_hourly_dir should be $uid_gid_required. Setting ownership..."
  
  # Set ownership to root
  chown root:root "$cron_hourly_dir"
  
  echo "Ownership for $cron_hourly_dir has been set to $uid_gid_required."
fi

# Verify permissions do not grant access to group or other
if [ "$permissions" != "$permissions_required" ]; then
  echo "Permissions for $cron_hourly_dir should be $permissions_required. Setting permissions..."
  
  # Set permissions to 0
  chmod og-rwx "$cron_hourly_dir"
  
  echo "Permissions for $cron_hourly_dir have been set to $permissions_required."
fi

