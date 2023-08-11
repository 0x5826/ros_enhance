#!/bin/bash

date="date +%Y-%m-%d"

listname="chnroute"

chnroute_list=$(curl -sSL https://raw.githubusercontent.com/mayaxcn/china-ip-list/master/chnroute.txt)

echo "/ip firewall address-list remove [/ip firewall address-list find list=$listname]" > chnroute_$date.rsc
echo "/ip firewall address-list" >> chnroute_$date.rsc

for chnroute_ip in $chnroute_list
do
    echo "add address=$chnroute_ip disabled=no list=$listname" >> chnroute_$date.rsc
done
