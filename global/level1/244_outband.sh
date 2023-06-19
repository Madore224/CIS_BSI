#!/bin/bash

# Verify rules for established incoming connections
incoming_tcp_udp_icmp=$(nft list ruleset | awk '/hook input/,/}/' | grep -E 'ip protocol (tcp|udp|icmp) ct state')
if [ -z "$incoming_tcp_udp_icmp" ]; then
  echo "No rules for established incoming connections found. Adding rules..."
  # Add rules for established incoming connections using "nft add rule"
  nft add rule inet filter input ip protocol tcp ct state established accept
  nft add rule inet filter input ip protocol udp ct state established accept
  nft add rule inet filter input ip protocol icmp ct state established accept
  echo "Rules for established incoming connections added successfully."
else
  echo "Rules for established incoming connections already exist."
fi

# Verify rules for established outgoing connections
outgoing_tcp_udp_icmp=$(nft list ruleset | awk '/hook output/,/}/' | grep -E 'ip protocol (tcp|udp|icmp) ct state')
if [ -z "$outgoing_tcp_udp_icmp" ]; then
  echo "No rules for established outgoing connections found. Adding rules..."
  # Add rules for established outgoing connections using "nft add rule"
  nft add rule inet filter output ip protocol tcp ct state new,related,established accept
  nft add rule inet filter output ip protocol udp ct state new,related,established accept
  nft add rule inet filter output ip protocol icmp ct state new,related,established accept
  echo "Rules for established outgoing connections added successfully."
else
  echo "Rules for established outgoing connections already exist."
fi

