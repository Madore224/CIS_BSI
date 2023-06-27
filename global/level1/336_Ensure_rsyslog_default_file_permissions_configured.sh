#!/bin/bash

echo "[+] Ensure rsyslog default file permission are configured"

# Check the $FileCreateMode setting in rsyslog configuration files
file_create_modes=$(grep '^\s*\$FileCreateMode' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2>/dev/null)

if [[ -n "$file_create_modes" ]]; then
  # Verify each instance of $FileCreateMode
  invalid_modes=0

  while IFS= read -r line; do
    mode=$(echo "$line" | awk '{print $2}')

    if [[ "$mode" -lt 640 ]]; then
      echo ""
      invalid_modes=$((invalid_modes + 1))
    fi
  done <<< "$file_create_modes"

  if [[ "$invalid_modes" -eq 0 ]]; then
    echo ""
  else
    echo ""
    sed -i 's/^\(\s*\$FileCreateMode\s*\)[0-9]\+/0640/' /etc/rsyslog.conf /etc/rsyslog.d/*.conf
    echo ""
  fi
else
  echo "No $FileCreateMode settings found in rsyslog configuration files."
fi
