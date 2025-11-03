#!/bin/bash

# Ask the user for input
read -p "Please enter number1: " NUMBER1
read -p "Please enter number2: " NUMBER2

# Check if number2 is zero to avoid division by zero
if [ "$NUMBER2" -eq 0 ]; then
    echo "Wrong input !!!! Division by zero is not allowed."
    exit 1
fi

# Perform division
RESULT=$((NUMBER1 / NUMBER2))

# Show the result
echo "Result: $RESULT"
