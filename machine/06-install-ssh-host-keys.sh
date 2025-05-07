#!/bin/sh

aws s3 sync s3://grodtron-private-keys/devdesktop/ssh/ /etc/ssh

chmod 600 /etc/ssh/ssh_host_*
chmod 644 /etc/ssh/ssh_host*.pub
