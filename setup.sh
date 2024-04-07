#!/bin/bash

apt update
apt install make git tmux python3-venv -y

wget -c https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
tar -C /usr/local/ -xzf go1.22.0.linux-amd64.tar.gz

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.bashrc
source ~/.bashrc

# Create wallet
mkdir $HOME/nimble && cd $HOME/nimble
git clone https://github.com/nimble-technology/wallet-public.git
cd wallet-public
make install

# Miner
cd $HOME/nimble
git clone https://github.com/nimble-technology/nimble-miner-public.git
cd nimble-miner-public
make install

tmux new -As miner
source ./nimenv_localminers/bin/activate