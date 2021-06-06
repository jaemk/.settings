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
    curl \
    neovim \
    ufw \
    dpkg-dev \
    libncurses5-dev \
    libsqlite3-dev \
    libbz2-dev \
    libffi-dev \
    libssl-dev \
    libgdbm-dev \
    zlib1g-dev \
    libjpeg-dev \
    libtiff-dev \
    libxml2-dev \
    libnotify-dev



echo "Setting up ufw ..."
ufw status
ufw default deny incoming
ufw default allow outgoing
ufw allow http
ufw allow https
ufw allow ssh  # denied later
ufw allow $ssh_port/tcp
ufw allow 60001:60999/udp  # mosh port range

echo "WARN: setup a user, 'adduser <name>; usermod -aG sudo <name>;'"
echo "WARN: -- remember to copy .ssh/authorized_keys and 'chown -R <name> .ssh'"
echo "WARN: --  'chmod 700 .ssh' ... 'chmod 644 .ssh/authorized_keys'"
echo "WARN: finish configuring ssh and then 'ufw deny ssh; ufw enable'"
read -p "Press enter to continue..."

echo "... copying settings to home dir ..."
if [ -d ~/.settings ]; then
    echo "source ~/.settings/.bashrc_stuff" >> ~/.bashrc

    mkdir -p ~/.config/nvim
    cp ~/.settings/init.vim ~/.config/nvim/init.vim

    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    cp ~/.settings/.tmux.conf ~/.tmux.conf
    cp ~/.settings/.inputrc ~/.inputrc
fi


echo "installing pyenv..."
mkdir -p bin/envs
git clone https://github.com/pyenv/pyenv.git ~/bin/pyenv
cd ~/.pyenv && src/configure && make -C src
cd ~/
source ~/.bashrc
pyenv install 2.7.18
pyenv install 3.9.5

echo "setting up neovim python envs"
mkdir -p ~/bin/envs/nvim2
mkdir -p ~/bin/envs/nvim

cd ~/bin/envs/nvim2
echo "2.7.18" > .python-version
pyenv exec python --version
pyenv exec python -m pip install virtualenv
pyenv exec python -m virtualenv venv
source venv/bin/activate
pip install neovim
deactivate

cd ~/bin/envs/nvim
echo "3.9.5" > .python-version
pyenv exec python --version
pyenv exec python -m pip install virtualenv
pyenv exec python -m virtualenv venv
source venv/bin/activate
pip install neovim
deactivate

echo "start nvim -> :PlugInstall"
read -p "Press enter to continue..."
