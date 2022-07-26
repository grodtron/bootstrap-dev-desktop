#!/bin/bash

set -eu

cat > $HOME/.env.sh <<EOF

export DOTFILES_GIT_REPO_DIR_NAME=.dotfiles-git-repo

EOF


source $HOME/.env.sh
