#!/bin/bash

# ======== CONFIGURATION ========
KEY_PATH="/home/ubuntu/pract.pem"         # Local SSH private key used to connect to servers
FILE_TO_COPY="/home/ubuntu/pract.pem"     # File to copy to each server
DEST_USER="ubuntu"
DEST_PATH="/home/ubuntu"
SERVER_LIST=("54.84.175.63" "44.211.251.128" "44.204.17.64")
# ================================

# Ensure correct permissions on the private key
chmod 400 "$KEY_PATH"

# Loop through each server
for SERVER in "${SERVER_LIST[@]}"; do
    echo "============================================="
    echo "📡 Connecting to $SERVER..."

    echo "📤 Copying pract.pem to $SERVER..."
    scp -v -i "$KEY_PATH" "$FILE_TO_COPY" "$DEST_USER@$SERVER:$DEST_PATH"
    
    if [ $? -ne 0 ]; then
        echo "❌ Error: Failed to transfer pract.pem to $SERVER"
        continue
    fi

    echo "🔧 Installing Ansible on $SERVER..."
    ssh -i "$KEY_PATH" "$DEST_USER@$SERVER" <<EOF
        set -e
        sudo apt update && sudo apt upgrade -y
        sudo apt install software-properties-common -y
        sudo add-apt-repository --yes --update ppa:ansible/ansible
        sudo apt install ansible -y
EOF

    if [ $? -eq 0 ]; then
        echo "✅ Success: Ansible installed on $SERVER"
    else
        echo "❌ Error: Failed to install Ansible on $SERVER"
    fi
done

echo "============================================="
echo "✅ All servers processed."
