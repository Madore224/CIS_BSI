#!/bin/bash

#page 64
echo "[+] Ensure nodev option set on /home partition"
command=$(mount)
if echo $command | grep -q -E '\s/home\s'
then
        command=$(mount | grep -E '\s/home\s')
        if ! echo $command | grep -q -v nodev
        then
                mount -o remount,nodev /home
        fi
fi

