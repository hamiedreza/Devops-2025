







#!/bin/bash

# تا وقتی کاربر چیزی وارد نکنه، دوباره بپرس
while [ -z "$MY_OS" ]; do
    read -p "Please enter your favorite OS: " MY_OS
done

sleep 2

# تبدیل به حروف کوچک و حذف عدد، فاصله و نشانه‌گذاری
MY_OS=$(echo "$MY_OS" | tr '[:upper:]' '[:lower:]' | tr -d '[:digit:]' | tr -d '[:blank:]' | tr -d '[:punct:]')

# بررسی مقدار
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

