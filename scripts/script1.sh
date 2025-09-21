

#!/bin/bash
# This is a description

MYNAME="hamiedreza"
output="/root/scripts/output_$(date +%Y%m%d)_${HOSTNAME}.log"

read -t 5 -n 20 -p "Please Enter your name: " USERNAME
echo ""  # خط جدید بعد از read

echo "Hello World $MYNAME!" | tee -a "$output"

echo "This is $0"
echo "This is $1"
echo "This is $2"
echo "This is $3"

find /root/scripts -name "output_*.log" -mtime +20 -delete

# scp $output hasosheh$IP /root/scripts or ~

