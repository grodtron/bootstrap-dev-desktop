#!/bin/bash

set -eu


## NOTE - first apt-get install dependencies
sudo apt-get install -y rlwrap openjdk-19-jdk-headless unzip

# See https://clojure.org/guides/install_clojure

INSTALL_SCRIPT=linux-install-1.11.1.1273.sh

curl -O https://download.clojure.org/install/$INSTALL_SCRIPT
chmod +x $INSTALL_SCRIPT
sudo ./$INSTALL_SCRIPT

rm $INSTALL_SCRIPT

# Possibly not needed
#wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
#sudo mv lein /usr/local/bin/lein
#sudo chmod +x /usr/local/bin/lein

# Possibly not needed
#curl -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
#chmod +x install
#sudo ./install
#rm install

# Formatting
ZPRINT_VERSION=1.2.5
curl -sLO https://github.com/kkinnear/zprint/releases/download/$ZPRINT_VERSION/zprintl-$ZPRINT_VERSION
chmod +x zprintl-$ZPRINT_VERSION
sudo mv zprintl-$ZPRINT_VERSION /usr/local/bin/zprint

# Linting
curl -sLO https://raw.githubusercontent.com/clj-kondo/clj-kondo/master/script/install-clj-kondo
chmod +x install-clj-kondo
sudo ./install-clj-kondo
rm install-clj-kondo
