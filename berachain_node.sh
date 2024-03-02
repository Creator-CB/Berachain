#!/bin/bash

set -e

bash <(curl -s https://raw.githubusercontent.com/Creator-CB/FILES/main/TDM-Crypto.sh)

sudo apt-get install git make screen jq -y

wget https://golang.org/dl/go1.21.4.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

go version
cd $HOME

git clone https://github.com/berachain/polaris

cd polaris

git checkout main

export PATH=$PATH:/usr/local/go/bin

make start

