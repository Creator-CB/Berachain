#!/bin/bash

set -e

# Update and upgrade system packages
apt-get update && sudo apt-get upgrade -y

# Install required packages
apt-get install git make screen jq curl -y

# Download and install Go
wget https://golang.org/dl/go1.21.4.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Verify Go installation
go version

# Run the installation script for Foundry
curl -L https://foundry.paradigm.xyz

# Source bashrc to apply changes
source /root/.bashrc

# Run foundryup command
foundryup

# Clone the GitHub repository
cd $HOME
git clone https://github.com/berachain/polaris
cd polaris

# Ensure dependencies are installed
make deps

# Start the installation process
make start
