#!/bin/bash

echo "[+] Ensure SSH PAM is enabled"

output=$(sshd -T | grep -i "usepam")

desired_value="usepam yes"

if [[ -n $output ]]; then
    if [[ "$output" == "$desired_value" ]]; then
        echo ""
    else
        echo ""
        echo ""
        sed -i 's/^.*usepam.*$/UsePAM yes/' /etc/ssh/sshd_config
        echo ""
    fi
else
    echo ""
fi

