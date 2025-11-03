#!/bin/bash


while [ -z "$num" ]; do
    read -p "Please enter your Number " num
done

sleep 2

read -p "Enter number 1: " num
max=$num
min=$num


for i in {2..20}
do
    read -p "Enter number $i: " num

    if [ "$num" -gt "$max" ]; then
        max=$num
    fi

    if [ "$num" -lt "$min" ]; then
        min=$num
    fi
done

echo "The largest number is: $max"
echo "The smallest number is: $min"

