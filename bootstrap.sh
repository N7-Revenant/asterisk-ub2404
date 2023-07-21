#!/usr/bin/env bash
set -o errexit
set -o nounset

apt-get update -y
apt-get upgrade -y

DEBIAN_FRONTEND=noninteractive apt-get install asterisk -y

sed --in-place 's/;verbose = 3/verbose = 9/' '/etc/asterisk/asterisk.conf'

cat /vagrant/asterisk/manager.conf > /etc/asterisk/manager.conf

cat /vagrant/asterisk/sip.conf > /etc/asterisk/sip.conf

service asterisk restart
