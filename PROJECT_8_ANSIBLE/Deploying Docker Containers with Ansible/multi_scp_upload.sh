#!/bin/bash

# ======== CONFIGURATION ========
KEY_PATH="/path/to/your-key.pem"
FILE_TO_COPY="/home/ubuntu/images-install.yml"
DEST_USER="ubuntu"
DEST_PATH="/home/ubuntu"
SERVER_LIST=("54.91.204.22" "44.202.236.226" "54.167.231.110")
# ================================

# Check key permissions
chmod 400 "$KEY_PATH"

# Loop through each IP and transfer the file
for SERVER in "${SERVER_LIST[@]}"; do
    echo "---------------------------------------------"
    echo "Transferring to $SERVER..."
    
    scp -v -i "$KEY_PATH" "$FILE_TO_COPY" "$DEST_USER@$SERVER:$DEST_PATH"
    
    if [ $? -eq 0 ]; then
        echo "✅ Success: File copied to $SERVER"
    else
        echo "❌ Failed: Could not copy to $SERVER"
    fi
done

echo "---------------------------------------------"
echo "📦 File transfer complete for all listed servers."
