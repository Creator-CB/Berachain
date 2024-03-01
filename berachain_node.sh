#!/bin/bash

set -e

# Execute TDM-Crypto.sh script
bash <(curl -s https://raw.githubusercontent.com/Creator-CB/FILES/main/TDM-Crypto.sh)

# Download and install Go
wget https://golang.org/dl/go1.21.4.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz

# Add Go binary directory to PATH
export PATH=$PATH:/usr/local/go/bin

# Verify Go installation
go version

# Execute Foundrip.sh script
bash <(curl -s https://raw.githubusercontent.com/Creator-CB/FILES/main/Foundrip.sh)

# Prompt user to continue
read -p "Press Enter to continue..."

# Source bashrc to apply changes
source /root/.bashrc

# Run foundryup command
foundryup
