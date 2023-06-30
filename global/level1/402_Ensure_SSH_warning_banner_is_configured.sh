#!/bin/bash

echo "[+] Ensure SSH warning banner is configured"

output=$(sshd -T | grep "banner")

desired_value="banner /etc/issue.net"

if [[ -n $output ]]; then
    if [[ "$output" == "$desired_value" ]]; then
        echo ""
    else
        echo ""
        echo ""
        sed -i 's/^.*banner.*$/banner \/etc\/issue.net/' /etc/ssh/sshd_config
        echo ""
    fi
else
    echo ""
fi

