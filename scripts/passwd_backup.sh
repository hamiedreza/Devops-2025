

#!/bin/bash


DIR="$HOME/passwd_backup"
mkdir -p "$DIR"


FILE="$DIR/$(date +%F).txt"


awk -F: '{print $1 ":" $3}' /etc/passwd > "$FILE"


find "$DIR" -type f -mtime +1 -name "*.txt" -exec rm {} \;

