#! /bin/bash
bash <(curl -s https://raw.githubusercontent.com/Creator-CB/FILES/main/TDM-Crypto.sh)

apt-get update && sudo apt-get upgrade -y

apt-get install git make screen jq curl -у

wget https://golang.org/d1/go1.21.4.linux-amd64.tar.gz

tar -C/usr/local -xzf go1.21.4.1inux-amd64. tar.gz

export PATH=SPATH:/us/local/go/bin

go version

bash < curl -s https://raw.githubusercontent.com/Creatfoundryupor-CB/FILES/main/Foundrip.sh)

source /root/.bashrc

foundryup

cd $HOME

git clone https://github.com/berachain/polaris

cd polaris

make start
