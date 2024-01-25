#!/bin/bash

# create a function to symklink files to the home directory
createsymlink() {
    echo "Creating symlink to $1"
    ln -sf $PWD/$1 $HOME//$1
}

echo "Creat symlinks"
createsymlink .bashrc
createsymlink .config/starship.toml

echo "Install brew"
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/codespace/.bashrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
source ~/.bashrc

echo "Install startship"
brew install starship

# -- install stolostron related dependencies

echo "Install go libs"
sh ./deps/go.sh

echo "Login to quay.io"
sh ./deps/quay.sh
