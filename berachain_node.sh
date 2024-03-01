#!/bin/bash

set -e

# Update and upgrade system packages
apt-get update && sudo apt-get upgrade -y

# Install required packages
apt-get install curl jq -y

# Retry the curl command a few times before giving up
max_retries=3
retry_delay=10
retries=0
while [ $retries -lt $max_retries ]; do
    if curl -L https://foundry.paradigm.xyz | sudo bash; then
        echo "Foundry installation successful."
        break
    else
        echo "Failed to install Foundry. Retrying in $retry_delay seconds..."
        sleep $retry_delay
        retries=$((retries+1))
    fi
done

# Check if installation was successful
if [ $retries -eq $max_retries ]; then
    echo "Error: Failed to install Foundry after $max_retries attempts."
    exit 1
fi

# Pause after basic installation
echo "Waiting for installation to complete..."
sleep 10

# Source bashrc to apply changes
source /root/.bashrc || source /etc/profile

# Run foundryup command
if foundryup; then
    echo "Foundryup command successful."
else
    echo "Error: foundryup command failed."
    exit 1
fi

# Source bashrc again after foundryup
source /root/.bashrc || source /etc/profile
