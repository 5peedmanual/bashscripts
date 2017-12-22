#!/bin/bash

# flush all rules, delete all chains and set default

# set the defaults

iptables -P INPUT ACCEPT
iptalbes -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# flush nat magle and all chains (-F) and delete all non-default chains (-X)

iptables -t nat -F
iptables -t mangle -F
iptables -F
iptables -X
