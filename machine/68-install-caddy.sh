#!/bin/sh

sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl gnupg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy

# Install TLS certificates to allow serving HTTPS
# NOTE/TODO - Caddy supports managing the letsencrypt certificates, when the current one expires,
# we should do that instead to refresh it.
sudo mkdir -p /etc/letsencrypt/live/gbgbgb.click/
sudo aws s3 sync s3://grodtron-private-keys/letsencrypt/gbgbgb.click/ /etc/letsencrypt/live/gbgbgb.click/

# Write the Caddyfile to proxy through to the local dev server
sudo tee /etc/caddy/Caddyfile << EOF 
# The Caddyfile is an easy way to configure your Caddy web server.
#
# Unless the file starts with a global options block, the first
# uncommented line is always the address of your site.
#
# To use your own domain name (with automatic HTTPS), first make
# sure your domain's A/AAAA DNS records are properly pointed to
# this machine's public IP, then replace ":80" below with your
# domain name.

:80 {
    # Set this path to your site's directory.
    root * /usr/share/caddy

    # Enable the static file server.
    file_server

    # Another common task is to set up a reverse proxy:
    # reverse_proxy localhost:8080

    # Or serve a PHP site through php-fpm:
    # php_fastcgi localhost:9000
}

gbgbgb.click {
    tls /etc/letsencrypt/live/gbgbgb.click/fullchain.pem /etc/letsencrypt/live/gbgbgb.click/privkey.pem

    reverse_proxy localhost:8081
}

# Refer to the Caddy docs for more information:
# https://caddyserver.com/docs/caddyfile
EOF

# Restart to ensure we reload the config
sudo systemctl restart caddy
