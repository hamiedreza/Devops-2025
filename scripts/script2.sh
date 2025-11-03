

#!/bin/bash

read -p "Enter 1st number: " var1
read -p "Enter 2nd number: " var2

var3=$(expr $var2 / $var1)
var4=$(expr $var1 \* $var2)

echo "Result of dividing is $var3 & multiplying is $var4"


