#!/bin/bash

set -eu

sudo useradd \
    -m \
    -p $6$ts:1659048158:$uTxYH1Q5StB3xAjuOPpREeVkrqb8Q2/Dosm1PVRCj1RlmctRjPxuGd7SsSV9a3A5AmnQ86UkIB3xmURWBsZBB/ \
    -s $(which zsh) \
    gordon
