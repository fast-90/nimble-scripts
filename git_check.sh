#!/bin/bash
cd $HOME/nimble/nimble-miner-public/

output=$(tmux capture-pane -t miner -p -S- -E- | sed '/^$/d' | tail -1 | awk -F '%' '{print $1}')
local_branch="main"

git fetch

if [ ${output} -lt 15 ] && ! git status | grep -q "Your branch is up to date with 'origin/${local_branch}'"; then
    git pull
    make install
    ~/nimble/scripts/tmux_miner.sh
else
    :
fi
