#!/bin/bash

#iptables -t nat -A POSTROUTING -j MASQUERADE
mkdir -p /run/supervisor
ferm -l /etc/ferm/ferm.conf
ip -4 route add local 192.168.70.0/23 dev eth0

ip route add 178.154.131.0/24 via 192.168.68.1 dev eth0
ip route add 93.158.134.0/24 via 192.168.68.1 dev eth0
ip route add 77.88.55.0/24 via 192.168.68.1 dev eth0
ip route add 5.255.255.0/24 via 192.168.68.1 dev eth0
ip route add 213.180.204.0/24 via 192.168.68.1 dev eth0
ip route add 213.180.193.0/24 via 192.168.68.1 dev eth0
ip route add 213.180.199.0/24 via 192.168.68.1 dev eth0
ip route add 87.250.251.0/24 via 192.168.68.1 dev eth0
ip route add 87.250.247.0/24 via 192.168.68.1 dev eth0
ip route add 87.250.254.0/24 via 192.168.68.1 dev eth0
ip route add 81.27.251.0/24 via 192.168.68.1 dev eth0
ip route add 87.250.250.0/24 via 192.168.68.1 dev eth0

exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
#exec /sbin/tini -- openvpn "$@"