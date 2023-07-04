#!/bin/bash

echo "[+] Ensure firewal rules exist for all open ports"

# Determine open ports
open_ports=$(ss -4tuln | awk 'NR>1 {print $5}' | awk -F':' '{print $2}')

# Fetch firewall rules
iptables_rules=$(iptables -L INPUT -v -n)

# Loop through each open port
for port in $open_ports; do
  # Check if port has a firewall rule
  if ! echo "$iptables_rules" | grep -q ":$port\b"; then
    # Determine protocol based on port
    protocol="tcp"
    if [[ $port -eq 53 ]]; then
      protocol="udp"
    fi

    # Add firewall rule for accepting inbound connections
    iptables -A INPUT -p "$protocol" --dport "$port" -m state --state NEW -j ACCEPT > /dev/null 2>&1
    echo ""
  fi
done

