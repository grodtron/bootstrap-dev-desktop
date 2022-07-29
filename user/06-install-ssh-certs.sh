#!/bin/bash

set -eu

aws s3 cp s3://grodtron-private-keys/github-2022-07-27 $HOME/.ssh/github

chmod go-rw $HOME/.ssh/github

aws s3 cp s3://grodtron-public-keys/personal_id_ed25519.pub - > $HOME/.ssh/authorized_keys
