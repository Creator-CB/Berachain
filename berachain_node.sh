#!/bin/bash

green="\e[32m"
red="\e[31m"
yellow="\e[33m"
normal="\e[0m"

function line {
  echo -e "${red}----------------------------------------------------${normal}"
}

function update_vps {
  apt-get update -y && apt-get upgrade -y
  apt-get install git make screen jq -y
}

function install_go {
  wget https://golang.org/dl/go1.17.5.linux-amd64.tar.gz
  tar -C /usr/local -xzf go1.17.5.linux-amd64.tar.gz
  export PATH=$PATH:/usr/local/go/bin
  go version
}

function setup_sources {
  cd $HOME || exit
  curl -L https://foundry.paradigm.xyz | bash
  source /root/.bashrc
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
  line
  update_vps
  line
  install_go
  line
  setup_sources
  line
  init_chain
  line
  switch_to_main
  line
  start_application
  line
}

main
