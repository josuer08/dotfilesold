#!/bin/bash

#nmap -sn 192.168.18.83/25 | grep 192 > log.txt && awk '{print $5}' log.txt | grep 192  | tee log.txt 
#for HOST in $(cat log.txt ) ; do ssh $HOST "uname -a" ; done
nmap -sn $1 > log.txt
grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" log.txt > iplist
