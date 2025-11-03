#!/usr/bin/env bash

iptables -P INPUT ACCEPT
iptables -F INPUT

iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT

iptables -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
iptables -A INPUT -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A INPUT -p icmp --icmp-type parameter-problem -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

iptables -A INPUT -i tailscale0 -p tcp --dport 2222 -j ACCEPT  # Only on workers
iptables -A INPUT -i tailscale0 -p tcp --dport 2377 -j ACCEPT  # Only on manager
iptables -A INPUT -i tailscale0 -p tcp --dport 7946 -j ACCEPT
iptables -A INPUT -i tailscale0 -p udp --dport 7946 -j ACCEPT
iptables -A INPUT -i tailscale0 -p udp --dport 4789 -j ACCEPT

iptables -P INPUT DROP
iptables -P FORWARD DROP

