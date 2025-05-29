#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh

# Without this, re-sourcing zshrc will try to open tmux
export TMUX='dont-open-tmux'
source ~/.zshrc

nvm install --lts 


