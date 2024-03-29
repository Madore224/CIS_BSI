#!/bin/sh

echo "[+] Ensure permission on all logifles are configured"

log_directory="/var/log"

# Run find command to check permissions on log files
result=$(find "$log_directory" -type f -ls | awk '{print $3, $4, $10}')

# Check if any files have incorrect permissions
if echo "$result" | grep -E -v "(^--- |^-w- |^--x )" >/dev/null; then
  echo ""
  
  # Set correct permissions on log files
  find "$log_directory" -type f -exec chmod go-rwx "{}" +
  find "$log_directory" -type d -exec chmod go-rwx "{}" +
  
  echo ""
else
  echo ""
fi

