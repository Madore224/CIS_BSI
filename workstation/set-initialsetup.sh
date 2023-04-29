#!/bin/bash

#page 22-32
for Module in "cramfs" "freevxfs" "jffs2" "hfs" "hfsplus" "udf" "vfat"
do
	required="install /bin/true "
	installstatus=$(modprobe -n -v $Module | grep -E "($Module|install)")
	if [ "$installstatus" != "$required" ]
	then
		touch /etc/modprobe.d/$Module.conf
		echo "install $Module /bin/true" > /etc/modprobe.d/$Module.conf
	fi
	installstatus=$(modprobe -n -v $Module | grep -E "($Module|install)")
	if [ "$installstatus" == "$required" ]
	then
		echo -e "\033[32m$Module success \033[0m"
	else
		echo -e "\033[31m$Module not success \033[0m"
	fi
done

#page 36
if [ "$(mount | grep -E '\s/tmp\s')" != "tmpfs on /tmp type tmpfs (rw,nosuid,nodev,noexec,relatime) " ]
then
	if [ "$(grep -E '\s/tmp\s' /etc/fstab | grep -E -v '^\s*#')" != "tmpfs /tmp tmpfs defaults,noexec,nosuid,nodev 0 0 " ]
	then
		cp -v /usr/share/systemd/tmp.mount /etc/systemd/system/
		diff /etc/systemd/system/tmp.mount /patch_files/tmp.mount > patch.patch
		patch /etc/systemd/system/tmp.mount -i patch.patch
		rm patch.patch
		systemctl daemon-reload
		systemctl --now enabled tmp.mount
	fi
fi

#page 40
#if [ "$(mount | grep -E '\s/tmp\s') | grep -v nodev" != "" ]
#then
	
#fi


#if [ "$(mount | grep -E '\s/dev/shm\s')" != "tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev,noexec,relatime,seclabel)" ]
#then
#	if [ "$(grep -E '\s/dev/shm\s' /etc/fstab)" != "tmpfs /dev/shm tmpfs defaults,noexec,nodev,nosuid 0 0" ]
#	then
#		sed -i 's/
#		mount -o remount,noexec,nodev,nosuid /dev/shm
#	fi
#fi

#page 68
#if [ "$(df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/#null != ' ') "]
#then
#	df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev-#null | xargs -I '{}' chmod a+t '{}'
#fi

#page 69
if [ "$(systemctl is-enabled autofs)" != "enabled" ]
then
	apt purge autofs
fi

#page 71
if [ "$(modprobe -n -v usb-storage | grep 'install' | grep '/bin/true')" == "" ]
then
	if [ "$(lsmod | grep 'usb-storage')" != "" ]
	then
		echo "install usb-storage /bin/true" >> /etc/modprobe.d/usb_storage.conf
		rmmod usb-storage
	fi
fi

#page 77
if [ "$(dpkg -s sudo | grep 'not installed')" != "" ]
then
	apt install -y sudo
fi

#page 83
if [ "$(dpkg -s aide | grep 'not installed')" != "" ]
then
	[ "$(dpkg -s aide-common | grep 'installed')" == "" ]
	then
		apt install -y aide aide-common
		aideinit
		mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
	fi
fi

#page 94
if [ "$(grep '^root:[*\!]:' /etc/shadow)" == "" ]
then
	passwd root
fi

#page 105
if [ "$(dpkg -s apparmor | grep 'not installed')" != "" ]
then
	apt install -y apparmor
fi

#page 124
if [ "$(dpkg -s upgrade | grep 'not installed')" != "" ]
then
	apt install -y apparmor
fi

#page 146
if [ "$(dpkg -s avahi-daemon | grep 'not installed')" == "" ]
then
	systemctl stop avahi-daemon.service
	systemctl stop avahi-daemon.socket
	apt purge avahi-daemon
fi

#page 147
if [ "$(dpkg -s cups | grep 'not installed')" == "" ]
then
	apt purge cups
fi

#page 149
if [ "$(dpkg -s isc-dhcp-server | grep 'not installed')" == "" ]
then
	apt purge isc-dhcp-server
fi

#page 150
if [ "$(dpkg -s slapd | grep 'not installed')" == "" ]
then
	apt purge slapd
fi

#page 151
if [ "$(dpkg -s nfs-kernel-server | grep 'not installed')" == "" ]
then
	apt purge rpcbind
fi

#page 152
if [ "$(dpkg -s bind9 | grep 'not installed')" == "" ]
then
	apt purge bind9
fi

#page 153
if [ "$(dpkg -s vsftpd | grep 'not installed')" == "" ]
then
	apt purge vsftpd
fi

#page 154
if [ "$(dpkg -s apache2 | grep 'not installed')" == "" ]
then
	apt purge apache2
fi

#page 155
if [ "$(dpkg -s dovecot-imapd | grep 'not installed')" == "" ]
then
	apt purge dovecot-imapd
fi

if [ "$(dpkg -s dovecot-pop3d | grep 'not installed')" == "" ]
then
	apt purge dovecot-pop3d
fi

#page 156
if [ "$(dpkg -s samba | grep 'not installed')" == "" ]
then
	apt purge samba
fi

#page 157
if [ "$(dpkg -s squid | grep 'not installed')" == "" ]
then
	apt purge squid
fi

#page 158
if [ "$(dpkg -s snmpd | grep 'not installed')" == "" ]
then
	apt purge snmpd
fi

#page 162
if [ "$(dpkg -s rsync | grep 'not installed')" == "" ]
then
	apt purge rsync
fi

#page 163 et 165
if [ "$(dpkg -s nis | grep 'not installed')" == "" ]
then
	apt purge nis
fi

#page 167
if [ "$(dpkg -s rsh-client | grep 'not installed')" == "" ]
then
	apt purge rsh-client
fi

#page 169
if [ "$(dpkg -s talk | grep 'not installed')" == "" ]
then
	apt purge talk
fi

#page 170
if [ "$(dpkg -s telnet | grep 'not installed')" == "" ]
then
	apt purge telnet
fi

#page 172
if [ "$(dpkg -s ldap-utils | grep 'not installed')" == "" ]
then
	apt purge ldap-utils
fi

#page 173
if [ "$(dpkg -s rpcbind | grep 'not installed')" == "" ]
then
	apt purge rpcbind
fi

#page 216
if [ "$(dpkg -s ufw | grep 'not installed')" != "" ]
then
	apt install -y ufw
fi

#page 218
if [ "$(dpkg-query -s iptables-persistent | grep 'not installed')" == "" ]
then
	apt purge iptables-persistent
fi
