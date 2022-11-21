#!/bin/bash

apt install iptables -y
apt install iptables-persistent -y

iptables -I INPUT -p udp --dport 5300 -j ACCEPT
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300

#iptables-save > /etc/iptables.up.rules
#iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
