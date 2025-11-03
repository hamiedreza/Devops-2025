




#!/bin/bash
IP="192.168.1.300"   # تست با آی‌پی نمونه

for i in {1..4}; do
    VAR=$(echo "$IP" | cut -d '.' -f$i)

    # بررسی: خالی نباشه و بین 0 تا 255 باشه
    if [ -z "$VAR" ] || [ "$VAR" -lt 0 ] || [ "$VAR" -gt 255 ]; then
        echo "Your IP is not correct ....."
        exit 1
    fi
done

echo "Your IP is correct!"

