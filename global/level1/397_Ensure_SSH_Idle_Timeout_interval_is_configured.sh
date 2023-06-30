#!/bin/bash

echo "[+] Ensure SSH idle timeout interval is configured"

output_interval=$(sshd -T | grep "clientaliveinterval")
output_countmax=$(sshd -T | grep "clientalivecountmax")

interval_min=1
interval_max=300
countmax_min=1
countmax_max=3

# Function to check if a value is within a range
check_range() {
    value=$1
    min=$2
    max=$3

    if [[ $value -ge $min && $value -le $max ]]; then
        return 0
    else
        return 1
    fi
}

if [[ -n $output_interval ]]; then
    interval=$(echo "$output_interval" | awk '{print $2}')
    if check_range "$interval" "$interval_min" "$interval_max"; then
        echo ""
    else
        echo ""
        echo ""
        sed -i 's/^.*ClientAliveInterval.*$/ClientAliveInterval 300/' /etc/ssh/sshd_config
        echo ""
    fi
else
    echo ""
fi

if [[ -n $output_countmax ]]; then
    countmax=$(echo "$output_countmax" | awk '{print $2}')
    if check_range "$countmax" "$countmax_min" "$countmax_max"; then
        echo ""
    else
        echo ""
        echo ""
        sed -i 's/^.*ClientAliveCountMax.*$/ClientAliveCountMax 3/' /etc/ssh/sshd_config
        echo ""
    fi
else
    echo ""
fi
