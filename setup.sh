#!/usr/bin/bash

apt update
apt install make git tmux python3-venv cron -y

wget -c https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
tar -C /usr/local/ -xzf go1.22.0.linux-amd64.tar.gz

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.bashrc
source ~/.bashrc

service start cron 

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

# Scripts
cd $HOME/nimble
git clone https://github.com/fast-90/nimble-scripts.git scripts
./scripts/tmux_miner.sh
crontab ./scripts/git_check_cronjob
