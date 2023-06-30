#!/bin/bash

echo "[+] Ensure IPv6 firewall rules exists for open ports"

# Check if IPv6 is disabled
ipv6_disabled=$(grep "^\s*linux" /boot/grub/grub.cfg | grep -v ipv6.disable=1)

if [[ -n "$ipv6_disabled" ]]; then
  echo ""
else
  # Determine open ports
  open_ports=$(ss -6tuln | awk 'NR>1 {print $5}' | awk -F':' '{print $NF}' | sort -u)

  # Check firewall rules
  firewall_rules=$(ip6tables -L INPUT -v -n)

  # Verify firewall rules for each open port
  for port in $open_ports; do
    # Exclude localhost addresses
    if [[ $port != "127.0.0.1" && $port != "::1" ]]; then
      rule_found=false

      # Verify firewall rule for the open port
      if echo "$firewall_rules" | grep -q "dpt:$port state NEW"; then
        echo ""
        rule_found=true
      fi

      # If no firewall rule found, add a new one
      if [[ "$rule_found" == false ]]; then
        echo ""
        ip6tables -A INPUT -p tcp --dport $port -m state --state NEW -j ACCEPT
      fi
    fi
  done
fi

