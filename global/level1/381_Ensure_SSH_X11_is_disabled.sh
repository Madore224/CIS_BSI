#!/bin/bash

echo "[+] Ensure SSH X11 is disabled"

output=$(sshd -T | grep "x11forwarding")

if [[ -n $output ]]; then
    if [[ $output == *"X11Forwarding no"* ]]; then
        echo ""
    else
        echo ""
        echo ""

        if grep -q "X11Forwarding" /etc/ssh/sshd_config; then
            sed -i 's/^.*X11Forwarding.*$/X11Forwarding no/' /etc/ssh/sshd_config
        else
            echo "" >> /etc/ssh/sshd_config
        fi

        echo ""
    fi
else
    echo ""
fi

