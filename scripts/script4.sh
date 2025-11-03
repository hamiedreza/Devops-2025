

#!/bin/bash
read -p "Let's see what is your favorite OS: " MY_OS

# اگر ورودی خالی بود
if [ -z "$MY_OS" ]; then
    echo "please write something"
    exit 0
fi

sleep 2

# تبدیل به حروف کوچک و حذف عدد، فاصله و نشانه‌گذاری
MY_OS=$(echo "$MY_OS" | tr '[:upper:]' '[:lower:]' | tr -d '[:digit:]' | tr -d '[:blank:]' | tr -d '[:punct:]')

if [ "$MY_OS" = "linux" ] || [ "$MY_OS" = "unix" ]; then
    sleep 0.02
    echo "Haha happy to hear that!!"
elif [ "$MY_OS" = "windows" ]; then
    sleep 0.02
    echo "shame on you!!"
elif [ "$MY_OS" = "mac" ]; then
    sleep 0.02
    echo "bad nist!!"
else
    echo "Not bad!!"
fi


