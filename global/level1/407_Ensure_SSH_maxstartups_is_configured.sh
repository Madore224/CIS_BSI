#!/bin/bash

echo "[+] Ensure SSH max stratups is configured"

output=$(sshd -T | grep -i "maxstartups")

desired_value="maxstartups 10:30:100"

if [[ -n $output ]]; then
    if [[ "$output" == "$desired_value" ]]; then
        echo ""
    else
        echo ""
        echo ""
        sed -i 's/^.*maxstartups.*$/MaxStartups 10:30:100/' /etc/ssh/sshd_config
        echo ""
    fi
else
    echo ""
fi

