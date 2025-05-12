#!/bin/sh

git clone ssh://git@codeberg.org/grodtron/sourcefarm.git

cd sourcefarm

npm install

echo ': 1747093649:0;npx expo start --web' > ~/.zsh_history
