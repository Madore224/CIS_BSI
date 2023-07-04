#!/bin/bash

echo "[+] Ensure Iptables are flushed"

# Check iptables rules
iptables_rules=$(iptables -L)
if [[ -z $iptables_rules ]]; then
  echo ""
else
  iptables -F
fi

# Check ip6tables rules
ip6tables_rules=$(ip6tables -L)
if [[ -z $ip6tables_rules ]]; then
  echo ""
else
  ip6tables -F
fi
