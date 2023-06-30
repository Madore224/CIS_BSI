#!/bin/bash

echo "[+] Ensure ssh ignore rhost is enabled"

output=$(sshd -T | grep "ignorerhosts")

if [[ -n $output ]]; then
    if [[ $output == *"IgnoreRhosts yes"* ]]; then
        echo ""
    else
        echo ""
        echo ""

        if grep -q "" /etc/ssh/sshd_config; then
            sed -i 's/^.*IgnoreRhosts.*$/IgnoreRhosts yes/' /etc/ssh/sshd_config
        else
            echo "" >> /etc/ssh/sshd_config
        fi

        echo ""
    fi
else
    echo ""
fi

