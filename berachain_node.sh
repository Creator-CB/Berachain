#!/bin/bash

green="\e[32m"
red="\e[31m"
yellow="\e[33m"
normal="\e[0m"

function logo {
  curl -s https://raw.githubusercontent.com/Creator-CB/FILES/main/TDM-Crypto.sh | bash
}


function update_vps {
  apt-get update -y && apt-get upgrade -y
  apt-get install git make screen jq -y
}

function install_go {
  wget https://golang.org/dl/go1.21.4.linux-amd64.tar.gz
  tar -C /usr/local -xzf go1.21.4.linux-amd64.tar.gz
  export PATH=$PATH:/usr/local/go/bin
  go version
}

function setup_sources {
  cd $HOME || exit
  curl -L https://foundry.paradigm.xyz | bash
  source /root/.bashrc
}

function dependency_need {
  foundryup
}

function init_chain {
  cd $HOME || exit
  git clone https://github.com/berachain/polaris
  cd polaris || exit
}

function switch_to_main {
  git checkout main
}

function start_application {
  make start
}

function main {
  logo
  update_vps
  line
  install_go
  line
  setup_sources
  line
  dependency_need
  line
  init_chain
  line
  switch_to_main
  line
  start_application
  line
}

main
