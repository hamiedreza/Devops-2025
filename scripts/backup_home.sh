



#!/bin/bash

USER_HOME="/home/$USER"

BACKUP_DIR="/backup/$USER"

BACKUP_FILE="$BACKUP_DIR/home_backup_$(date +%F_%H-%M-%S).tar.gz"


mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_FILE" -C "/home" "$USER"

echo "Backup completed: $BACKUP_FILE"

find "$BACKUP_DIR" -name "home_backup_*.tar.gz" -type f -mtime +30 -exec rm -f {} \;
