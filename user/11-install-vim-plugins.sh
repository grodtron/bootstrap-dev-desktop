#!/bin/bash

set -eu

PLUGIN_ROOT=~/.vim/bundle

mkdir -p $PLUGIN_ROOT

for plugin in $(grep '^Plugin' ~/.vimrc | awk '{print $2}' | tr -d "'")
do
    plugin_name=$(basename $plugin)
    url=https://github.com/$plugin
    dest=$PLUGIN_ROOT/$plugin_name

    git clone $url $dest || echo "Skipping $plugin"
done
