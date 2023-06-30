#!/bin/env bash

echo "[+]Ensure outbound and established connections"

# Verify iptables rules
iptables_rules=$(iptables -L -v -n)
expected_rules=(
  "-p tcp -m state --state NEW,ESTABLISHED -j ACCEPT"
  "-p udp -m state --state NEW,ESTABLISHED -j ACCEPT"
  "-p icmp -m state --state NEW,ESTABLISHED -j ACCEPT"
  "-p tcp -m state --state ESTABLISHED -j ACCEPT"
  "-p udp -m state --state ESTABLISHED -j ACCEPT"
  "-p icmp -m state --state ESTABLISHED -j ACCEPT"
)

rules_to_add=()

for rule in "${expected_rules[@]}"; do
  if ! echo "$iptables_rules" | grep -q "$rule"; then
    rules_to_add+=("$rule")
  fi
done

# Add missing rules
if [[ ${#rules_to_add[@]} -gt 0 ]]; then
  echo ""
  for rule in "${rules_to_add[@]}"; do
    iptables -A OUTPUT "$rule"
    iptables -A INPUT "$rule"
  done
else
  echo ""
fi

