#!/bin/bash

# ======== CONFIGURATION ========
KEY_PATH="/home/ubuntu/pract.pem"
FILE_TO_COPY="/home/ubuntu/images-install.yml"
DEST_USER="ubuntu"
DEST_PATH="/home/ubuntu"
SERVER_LIST=("54.84.175.63" "44.211.251.128" "44.204.17.64")
# ================================

# Ensure key has correct permissions
chmod 400 "$KEY_PATH"

# Loop through each server
for SERVER in "${SERVER_LIST[@]}"; do
    echo "============================================="
    echo "📡 Connecting to $SERVER..."

    echo "📤 Transferring Ansible playbook..."
    scp -v -i "$KEY_PATH" "$FILE_TO_COPY" "$DEST_USER@$SERVER:$DEST_PATH"
    
    if [ $? -ne 0 ]; then
        echo "❌ Error: File transfer failed for $SERVER"
        continue
    fi

    echo "🔧 Installing Ansible on $SERVER..."
    ssh -i "$KEY_PATH" "$DEST_USER@$SERVER" <<EOF
        set -e
        sudo apt update && sudo apt upgrade -y
        sudo apt install software-properties-common -y
        sudo add-apt-repository --yes --update ppa:ansible/ansible
        sudo apt install ansible -y
        echo "🔎 Verifying Ansible installation..."
        ansible --version
EOF

    if [ $? -eq 0 ]; then
        echo "✅ Success: Ansible installed and verified on $SERVER"
    else
        echo "❌ Error: Failed during Ansible setup on $SERVER"
    fi
done

echo "============================================="
echo "✅ All servers processed."
