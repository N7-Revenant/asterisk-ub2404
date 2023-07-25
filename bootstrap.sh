#!/usr/bin/env bash
set -o errexit
set -o nounset

apt-get update -y
apt-get upgrade -y

DEBIAN_FRONTEND=noninteractive apt-get install asterisk -y

sed --in-place 's/;verbose = 3/verbose = 9/' '/etc/asterisk/asterisk.conf'

cat /vagrant/asterisk/manager.conf > /etc/asterisk/manager.conf

cat /vagrant/asterisk/sip.conf > /etc/asterisk/sip.conf

cat /vagrant/asterisk/queues.conf > /etc/asterisk/queues.conf

cat /vagrant/asterisk/extensions.conf > /etc/asterisk/extensions.conf

service asterisk restart

asterisk -rx "channel originate Local/add@commands extension s@commands"
asterisk -rx "queue show SG_Test"
