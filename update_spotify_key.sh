#!/bin/bash

# Update Spotify repo signing key
## Based on: https://www.spotify.com/download/linux/


echo "Remove the expired repo signing key(s)"

cd /etc/apt/trusted.gpg.d/ || {
    echo "Failed to change directory to /etc/apt/trusted.gpg.d/. Please check if the APT repo signing key diretory /etc/apt/trusted.gpg.d/ exists."
    exit 1
}

rm -f spotify*.gpg

echo "Add the new signing key"

curl -sS https://download.spotify.com/debian/pubkey_5384CE82BA52C83A.asc | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
