#!/usr/bin/env bash
set -o errexit
set -o nounset

apt-get update -y
apt-get upgrade -y

DEBIAN_FRONTEND=noninteractive apt-get install asterisk -y
