





#!/bin/bash

i=1
while [ $i -le 50 ]; do
    echo "welcome $i items!"

    if [ $i -eq 5 ]; then
        break
    fi

    i=$((i+1))
done

echo "this is after the loop"

