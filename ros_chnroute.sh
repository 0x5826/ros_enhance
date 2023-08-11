#!/bin/bash

listname="chnroute"

chnroute_list=$(curl -sSL https://raw.githubusercontent.com/mayaxcn/china-ip-list/master/chnroute.txt)

echo "/ip firewall address-list remove [/ip firewall address-list find list=$listname]" > chnroute.rsc
echo "/ip firewall address-list" >> chnroute.rsc
echo "add address=10.0.0.0/8 disabled=no list=$listname" >> chnroute.rsc
echo "add address=172.16.0.0/12 disabled=no list=$listname" >> chnroute.rsc
echo "add address=192.168.0.0/16 disabled=no list=$listname" >> chnroute.rsc

for chnroute_ip in $chnroute_list
do
    echo "add address=$chnroute_ip disabled=no list=$listname" >> chnroute.rsc
done
