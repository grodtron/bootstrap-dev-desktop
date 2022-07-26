#!/bin/bash

set -eu

download_binary_name=bazelisk-linux-amd64

latest_release=$(curl -H "Accept: application/vnd.github+json" https://api.github.com/repos/bazelbuild/bazelisk/releases/latest)

release_name=$(echo "$latest_release" | jq -r '.name')

release_url=$(echo "$latest_release" | jq -r '.assets | map(select(.name == "'$download_binary_name'")) | first.browser_download_url')

echo "Downloading bazelisk $release_name ($release_url)"

wget $release_url

target_binary_name=/usr/bin/bazel-$release_name
target_link_name=/usr/bin/bazel

chmod a+x $download_binary_name

sudo mv $download_binary_name $target_binary_name
sudo chown root:root $target_binary_name
sudo ln $target_binary_name $target_link_name
