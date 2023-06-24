#!/bin/bash

#page 36 to 44
echo -e "[+] $green Ensure /tmp is configured $endcolor"

command=$(mount)
if ! echo $command | grep -q -E '\s/tmp\s'
then
        command=$(systemctl is-enabled tmp.mount)
        if ! echo $command | grep -q -E 'enabled'
        then
                echo -e "[+] $green Patching /etc/systemd/system/tmp.mount $endcolor"
                cp -v /usr/share/systemd/tmp.mount /etc/systemd/system/ > /dev/null 2>&1
                diff /etc/systemd/system/tmp.mount global/level1/patch_files/tmp.mount > patch.patch
                patch /etc/systemd/system/tmp.mount -i patch.patch > /dev/null 2>&1
                rm patch.patch > /dev/null 2>&1
                systemctl daemon-reload > /dev/null 2>&1
                systemctl --now enable tmp.mount > /dev/null 2>&1
                mount -o remount,nodev /tmp 
                mount -o remount,nosuid /tmp
                mount -o remount,noexec /tmp
        fi
fi
