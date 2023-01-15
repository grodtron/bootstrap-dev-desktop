#!/bin/bash

set -eu


#########
# Add deb for LLVM / Clang 15

# See https://askubuntu.com/a/1300076 on all this key wrangling
wget https://apt.llvm.org/llvm-snapshot.gpg.key

sudo mkdir -p /etc/keys/

gpg --no-default-keyring --keyring ./llvm_keyring.gpg --import llvm-snapshot.gpg.key
gpg --no-default-keyring --keyring ./llvm_keyring.gpg --export > ./llvm-snapshot.gpg

sudo cp ./llvm-snapshot.gpg /etc/keys/llvm-snapshot.gpg

sudo echo "deb [signed-by=/etc/keys/llvm-snapshot.gpg] http://apt.llvm.org/jammy/ llvm-toolchain-jammy-15 main" >> /etc/apt/sources.list

#########

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install -y \
    clang-15 \
    clang-format \
    tree \
    silversearcher-ag \
    awscli \
    jq \
    zsh \


