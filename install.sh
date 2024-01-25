#!/bin/bash
# create a function to symklink files to the home directory
createsymlink() {
    echo "Creating symlink to $1"
    ln -sf $PWD/$1 $HOME//$1
}

# -- install fish shell related plugins

echo "Creat symlink to config.fish"
createsymlink .config/fish/config.fish # env variables are set in config.fish

echo "Install brew"
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# -- install stolostron related dependencies

echo "Install go libs"
sh ./deps/go.sh

echo "Login to quay.io"
sh ./deps/quay.sh
