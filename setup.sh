#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Error: Please specify an ssh port"
    exit 1
fi
ssh_port="$1"


echo "Installing packages ..."
apt install -y \
    coreutils \
    git \
    tmux \
    vim \
    python-dev \
    python-pip \
    python3-dev \
    python3-pip \
    postgresql \
    nginx \
    ufw


echo "Setting up ufw ..."
ufw status
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow www
ufw allow $ssh_port/tcp

echo "WARN: setup a user, 'adduser <name>; usermod -aG sudo <name>;'"
echo "WARN: -- remember to copy .ssh/authorized_keys and 'chown -R <name> .ssh'"
echo "WARN: finish configuring ssh and then 'ufw deny ssh; ufw enable'"

echo "... copying settings to home dir ..."
if [ -d ~/.settings ]; then
    cp ~/.settings/.vimrc ~/.vimrc
fi
