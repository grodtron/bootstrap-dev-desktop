#!/bin/bash

set -eu

source env.sh

for file in $(ls -1 machine/)
do
    ./$file 2>&1 | tee ${file%.*}.log
done

for file in $(ls -1 user/)
do
    sudo -u gordon -g gordon --preserve-env=DOTFILES_GIT_REPO_DIR_NAME ./$file 2>&1 | tee ${file%.*}.log
done
