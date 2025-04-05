#!/bin/bash

# Function to download large files from Google Drive using file ID
download_from_gdrive () {
    FILEID=$1
    FILENAME=$2

    echo "🔽 Downloading $FILENAME ..."
    CONFIRM=$(curl -sc /tmp/gcookie "https://drive.google.com/uc?export=download&id=${FILEID}" | \
              grep -o 'confirm=[^&]*' | sed 's/confirm=//')

    curl -Lb /tmp/gcookie "https://drive.google.com/uc?export=download&confirm=${CONFIRM}&id=${FILEID}" \
         -o "${FILENAME}"
}

# Download files
download_from_gdrive "1-Gu8Vpp7t2nc2UlHiVHow-YoDK0U93F0" "section1.gz"
download_from_gdrive "1PqDOzHxKyfZHwtp7-ZKk5SiGVKV0h75E" "section2.gz"
download_from_gdrive "1WF2tZ9oznaKz4rYjz7BoTm0wJ2pNdN49" "section3.gz"

# Extract files
echo "📦 Extracting files..."
gunzip -f section1.gz
gunzip -f section2.gz
gunzip -f section3.gz

echo "✅ All files downloaded and extracted successfully!"
