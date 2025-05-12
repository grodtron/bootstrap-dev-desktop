#!/bin/sh

curl https://sh.rustup.rs -sSf | sh

cargo install cargo-binstall

cargo binstall --strategies crate-meta-data jj-cli
