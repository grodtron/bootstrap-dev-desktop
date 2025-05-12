#!/bin/sh

curl https://sh.rustup.rs -sSf > rustup.sh

chmod +x rustup.sh

./rustup.sh -y

export PATH=$PATH:$HOME/.cargo/bin

cargo install cargo-binstall

cargo binstall -y --strategies crate-meta-data jj-cli
