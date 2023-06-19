#!/bin/bash

echo -e "[+] Ensure bogus ICMP responses are ignored"

command1=$(sysctl net.ipv4.icmp_ignore_bogus_error_responses)
command2=$(grep "net.ipv4.icmp_ignore_bogus_error_responses" /etc/sysctl.conf /etc/sysctl.d/*)

if [ ! echo $command1 | grep -q "net.ipv4.icmp_ignore_bogus_error_responses = 1" ] || [ ! echo $command2 | grep -q "net.ipv4.icmp_ignore_bogus_error_responses = 1" ]
then
	echo "net.ipv4.icmp_ignore_bogus_error_responses = 1" >>  /etc/sysctl.conf
	sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1
	sysctl -w net.ipv4.route.flush=1
fi