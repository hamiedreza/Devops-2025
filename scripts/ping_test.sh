


#!/bin/bash

 
IP_FILE="ip_list.txt"

HOSTNAME=$(hostname)


DATE=$(date +%F)


LOG_FILE="ping_log_${HOSTNAME}_${DATE}.log"


echo "Ping Test on $DATE from $HOSTNAME" > "$LOG_FILE"
echo "-----------------------------------" >> "$LOG_FILE"


while read -r ip; do
    if [ -n "$ip" ]; then
        echo "Pinging $ip ..." >> "$LOG_FILE"
        ping -c 4 "$ip" >> "$LOG_FILE" 2>&1
        echo "---------------------------" >> "$LOG_FILE"
    fi
done < "$IP_FILE"

echo "All results saved in $LOG_FILE"


find . -name "ping_log_${HOSTNAME}_*.log" -type f -mtime +30 -exec rm -f {} \;

