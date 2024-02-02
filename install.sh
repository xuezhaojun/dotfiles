#!/bin/bash

# -- install stolostron related dependencies
echo "Install go libs"
sh ./go.sh

echo "Restore the docker auths"
sh ./auth_merge.sh

echo "Set special environment variables"
# To fix error when run make in multicluster-operators-foundation repo:
# vendor/github.com/openshift/build-machinery-go/make/targets/golang/../../lib/golang.mk:23: *** `go` is required with minimal version "1.15.2", detected version "1.21.6". You can override this check by using `make GO_REQUIRED_MIN_VERSION:=`.  Stop.
echo "export GO_REQUIRED_MIN_VERSION=\"\"" >> /home/codespace/.zshrc

echo "Install brew and some brew packages"
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> /home/codespace/.zshrc
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install autojump
brew install zsh-autosuggestions
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> /home/codespace/.zshrc
echo "[ -f /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh ] && . /home/linuxbrew/.linuxbrew/etc/profile.d/autojump.sh" >> /home/codespace/.zshrc
