#!/usr/bin/env bash
set -o errexit
set -o nounset

wget -qO - http://tc-build.telecontact.ru/linux/debian/repository/repo-keys.asc | tee /etc/apt/trusted.gpg.d/telecc-repo-keys.asc

sh -c "echo 'deb http://tc-build.telecontact.ru/linux/debian/repository/tcdev/build/ noble main
'>> /etc/apt/sources.list.d/telecc.list"

apt-get update -y
apt-get upgrade -y

DEBIAN_FRONTEND=noninteractive apt-get install asterisk -y

sed --in-place 's/;verbose = 3/verbose = 9/' '/etc/asterisk/asterisk.conf'

cat /vagrant/asterisk/manager.conf > /etc/asterisk/manager.conf

cat /vagrant/asterisk/sip.conf > /etc/asterisk/sip.conf

cat /vagrant/asterisk/queues.conf > /etc/asterisk/queues.conf

cat /vagrant/asterisk/extensions.conf > /etc/asterisk/extensions.conf

cat /vagrant/hosts > /etc/hosts

service asterisk restart

asterisk -rx "channel originate Local/add@commands extension s@commands"
asterisk -rx "queue show SG_Test"
