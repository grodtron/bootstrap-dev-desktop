#!/bin/bash

set -eu

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install -y \
    clang-14 \
    clang-format \
    tree \
    silversearcher-ag \
    awscli \
    jq \
    zsh \


