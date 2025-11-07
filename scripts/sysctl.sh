#!/usr/bin/env bash

sudo tee /etc/sysctl.d/99-bbr.conf > /dev/null << "EOF"
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
EOF

sudo sysctl -p /etc/sysctl.d/99-bbr.conf

sudo tee /etc/sysctl.d/99-ipv6.conf > /dev/null << "EOF"
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
EOF

sudo sysctl -p /etc/sysctl.d/99-ipv6.conf

