#!/bin/bash

echo "[+] Ensure SSH login race time is set"

output=$(sshd -T | grep "logingracetime")

desired_range="1-60,1m"

if [[ -n $output ]]; then
    logingracetime=$(echo "$output" | awk '{print $2}')
    if [[ $logingracetime =~ ^([0-9]+|[0-9]+[mM])$ ]]; then
        if [[ $logingracetime -ge 1 && $logingracetime -le 60 || $logingracetime == "1m" || $logingracetime == "1M" ]]; then
            echo ""
        else
            echo ""
            echo ""
            sed -i 's/^.*LoginGraceTime.*$/LoginGraceTime 60/' /etc/ssh/sshd_config
            echo ""
        fi
    else
        echo ""
    fi
else
    echo ""
fi

