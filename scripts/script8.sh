






#!/bin/bash

i=1
while [ $i -le 50 ]; do
    echo "welcome $i items!"

    if [ $((i % 5)) -eq 0 ]; then
        echo "Hop"
        break
    fi

    i=$((i+1))
done

echo "this is after the loop"

