#!/bin/bash

set -eu


#########
# Add deb for LLVM / Clang 16

# See https://askubuntu.com/a/1300076 on all this key wrangling
wget https://apt.llvm.org/llvm-snapshot.gpg.key

sudo mkdir -p /etc/keys/

gpg --no-default-keyring --keyring ./llvm_keyring.gpg --import llvm-snapshot.gpg.key
gpg --no-default-keyring --keyring ./llvm_keyring.gpg --export > ./llvm-snapshot.gpg

sudo cp ./llvm-snapshot.gpg /etc/keys/llvm-snapshot.gpg

echo "deb [signed-by=/etc/keys/llvm-snapshot.gpg] http://apt.llvm.org/jammy/ llvm-toolchain-jammy-16 main" | \
   sudo tee --append /etc/apt/sources.list

#########
# Add deb for terraform

# Annoying that the commands here are so different from those above for LLVM,
# but not worth messing with, if it works, it works.
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg | file -

gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

#########

sudo apt-get update -y

sudo apt-get upgrade -y

sudo apt-get install -y \
    clang-16 \
    clang-format \
    tree \
    silversearcher-ag \
    awscli \
    jq \
    zsh \
    terraform \


