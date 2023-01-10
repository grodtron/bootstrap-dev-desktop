#!/bin/sh

set -eu

# For some reason this is necessary for the following commands to work. 
cd $HOME

git config --global user.name "Gordon Bailey"
git config --global user.email "github@gordonbailey.net"
