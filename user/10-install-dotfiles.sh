#!/bin/bash

set -eu

# For some reason git submodule commands don't work properly when you're
# outside of the repo
cd $HOME

git clone --bare https://github.com/grodtron/dotfiles.git $HOME/$DOTFILES_GIT_REPO_DIR_NAME

# I wanted to use an alias here, but for some reason it was not working...
dotfilegit="git --git-dir $HOME/$DOTFILES_GIT_REPO_DIR_NAME --work-tree $HOME"

$dotfilegit checkout
$dotfilegit submodule init
$dotfilegit submodule update

# Set the upstream of our mainline to origin mainline
$dotfilegit config status.showUntrackedFiles no
$dotfilegit config remote.origin.fetch 'refs/heads/*:refs/remotes/origin/*'
$dotfilegit fetch origin
$dotfilegit branch --set-upstream-to origin/mainline mainline

# Once everything is bootstrapped, then we would want to use the SSH URL
$dotfilegit remote set-url git@github.com:grodtron/dotfiles.git
