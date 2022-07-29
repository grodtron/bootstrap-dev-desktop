#!/bin/bash

set -eu

# For some reason git submodule commands don't work properly when you're
# outside of the repo
cd $HOME

git clone --bare https://github.com/grodtron/dotfiles.git $HOME/$DOTFILES_GIT_REPO_DIR_NAME

git --git-dir "$HOME/$DOTFILES_GIT_REPO_DIR_NAME" --work-tree "$HOME" checkout
git --git-dir "$HOME/$DOTFILES_GIT_REPO_DIR_NAME" --work-tree "$HOME" submodule init
git --git-dir "$HOME/$DOTFILES_GIT_REPO_DIR_NAME" --work-tree "$HOME" submodule update


