#!/bin/bash

# Verify policy of base chains
input_chain=$(nft list ruleset | grep 'hook input')
forward_chain=$(nft list ruleset | grep 'hook forward')
output_chain=$(nft list ruleset | grep 'hook output')

if [ ! "$input_chain" =~ "policy drop" ]; then
  # Set policy of input chain to DROP using "nft chain"
  nft chain inet filter input { policy drop \; }
else
  echo ""
fi

if [[ ! "$forward_chain" =~ "policy drop" ]]; then
  # Set policy of forward chain to DROP using "nft chain"
  nft chain inet filter forward { policy drop \; }
else
  echo ""
fi

if [[ ! "$output_chain" =~ "policy drop" ]]; then
  # Set policy of output chain to DROP using "nft chain"
  nft chain inet filter output { policy drop \; }
else
  echo ""
fi

