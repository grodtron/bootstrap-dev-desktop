#!/bin/bash

set -eu

for plugin in $(grep '^Plugin' ~/.vimrc | awk '{print $2}' | tr -d "'")
do
    plugin_name=$(basename $plugin)
    url=https://github.com/$plugin
    dest=~/.vim/bundle/$plugin_name

    git clone $url $dest
done
