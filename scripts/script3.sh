




#!/bin/bash

read -p "Enter your first number: " var1
read -p "Enter your second number: " var2

if [ $var1 -gt $var2 ]
then
   var4=`echo "scale=3; $var1/$var2" | bc`
else
   var4=`echo "scale=3; $var2/$var1" | bc`
fi

echo "Dividing is $var4"

