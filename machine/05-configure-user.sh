#!/bin/bash

set -eu

sudo useradd \
    -m \
    -p '$6$1659052059$M9pnSDGYdkzT9Gq6quAaaxxY8KRHGyD1SmUNcYYhmvQ3NyQyZ8RQ3xG93op647vp8eHAP1VfsJnmWxHl8kiT10' \
    -s $(which zsh) \
    gordon

sudo usermod -aG sudo gordon
