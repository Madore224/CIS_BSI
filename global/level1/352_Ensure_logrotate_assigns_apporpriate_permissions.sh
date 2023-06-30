#!/bin/bash

config_file="/etc/logrotate.conf"

# Run command to check create lines in logrotate.conf
output=$(grep -E "^\s*create\s+\S+" "$config_file" | grep -E -v "\s(0)?[0-6][04]0\s")

# Check if any lines are returned
if [[ -n "$output" ]]; then
  echo "Some 'create' lines in logrotate.conf are not set to 0640 or more restrictive. Modifying the configuration..."
  
  # Update create lines to read 0640 or more restrictive
  sed -i 's/^\(\s*create\s\+\)\S\+/\10640/' "$config_file"
  
  echo "The 'create' lines in logrotate.conf have been updated."
else
  echo "The 'create' lines in logrotate.conf are already set to 0640 or more restrictive."
fi

