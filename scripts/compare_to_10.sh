

#!/bin/bash

read -p "Enter a number: " num

if [ "$num" -gt 10 ]; then
    echo "The number is larger than 10."
elif [ "$num" -eq 10 ]; then
    echo "The number is equal to 10."
else
    echo "The number is smaller than 10."
fi

