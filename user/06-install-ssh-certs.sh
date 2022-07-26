#!/bin/bash

set -eu

aws s3 cp s3://grodtron-private-keys/github-2022-07-27 $HOME/.ssh/github
