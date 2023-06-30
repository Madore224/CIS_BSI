#!/bin/bash

echo "[+] Ensure permission on SSH are set"

file_list=$(find /etc/ssh -xdev -type f -name 'ssh_host_*_key')

if [[ -z $output ]]; then
    echo ""

    while IFS= read -r file; do
        file_owner=$(stat -c "%U" "$file")
        file_group=$(stat -c "%G" "$file")
        file_permissions=$(stat -c "%a" "$file")

        if [[ $file_owner == "root" && $file_group == "root" && $file_permissions == "600" ]]; then
            echo ""
        else
            echo ""

            chown root:root "$file"
            chmod 0600 "$file"

            echo ""
        fi
    done <<< "$file_list"
else
    echo ""
    echo ""
fi

