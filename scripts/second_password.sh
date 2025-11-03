#!/bin/bash

# Path to the file that stores the hash of the second password
HASH_FILE="$HOME/.second_pass_hash"

# If the hash file does not exist, create it
if [ ! -f "$HASH_FILE" ]; then
    echo "Setting up your second password for the first time:"
    read -s -p "Enter new second password: " pass
    echo
    hashed_pass=$(echo -n "$pass" | sha256sum | awk '{print $1}')
    echo "$hashed_pass" > "$HASH_FILE"
    chmod 600 "$HASH_FILE"
    echo "Second password has been set. Please log in again."
    exit 0
fi

# Ask for the second password
read -s -p "Enter your second password: " second_pass
echo

# Compute the hash of the entered password
entered_hash=$(echo -n "$second_pass" | sha256sum | awk '{print $1}')

# Read the stored hash
saved_hash=$(cat "$HASH_FILE")

# Compare the two hashes
if [ "$entered_hash" = "$saved_hash" ]; then
    echo "✅ Login successful"
else
    echo "❌ Incorrect second password. Logging out..."
    sleep 1
    exit 1
fi

