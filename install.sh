#!/bin/bash

# create a function to symklink files to the home directory
createsymlink() {
    echo "Creating symlink to $1"
    ln -sf $PWD/$1 $HOME//$1
}

echo "Install brew"
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/codespace/.zshrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install autojump
brew install zsh-autosuggestions
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> /home/codespace/.zshrc
echo "[ -f /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh ] && . /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh" >> /home/codespace/.zshrc

# -- install stolostron related dependencies
echo "Install go libs"
sh ./deps/go.sh

echo "Login to quay.io"
sh ./deps/quay.sh

# To fix error when run make in multicluster-operators-foundation repo:
# vendor/github.com/openshift/build-machinery-go/make/targets/golang/../../lib/golang.mk:23: *** `go` is required with minimal version "1.15.2", detected version "1.21.6". You can override this check by using `make GO_REQUIRED_MIN_VERSION:=`.  Stop.
echo "export GO_REQUIRED_MIN_VERSION=\"\"" >> /home/codespace/.zshrc