#!/bin/bash

echo "[+] Ensure SSH maxsessions is limited"

output=$(sshd -T | grep -i "maxsessions")

desired_value="maxsessions 10"

if [[ -n $output ]]; then
    if [[ "$output" == "$desired_value" ]]; then
        echo ""
    else
        echo ""
        echo ""
        sed -i 's/^.*maxsessions.*$/MaxSessions 10/' /etc/ssh/sshd_config
        echo ""
    fi
else
    echo ""
fi

