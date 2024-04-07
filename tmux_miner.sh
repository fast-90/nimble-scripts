#!/bin/bash
tmux kill-session -t miner
tmux new -As miner
tmux send-keys -t miner "cd ~/nimble/nimble-miner-public/" Enter
tmux send-keys -t miner "source ./nimenv_localminers/bin/activate" Enter
tmux send-keys -t miner "make run addr=${WALLET}" Enter
