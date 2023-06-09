#!/bin/bash

#page 53 to 57

echo "[+] Ensure nodev,nosuid,noexec option set on /set/tmp partition"
command=$(mount)
if echo $command | grep -q -E '\s/var/tmp\s'
then
        mount -o remount,nodev /var/tmp 
        mount -o remount,nosuid /var/tmp
        mount -o remount,noexec /var/tmp
fi
