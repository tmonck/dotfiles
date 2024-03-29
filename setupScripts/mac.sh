#!/usr/bin/env bash
# DO NOT EDIT THIS FILE DIRECTLY!
# This file is auto-generated from Applications.org

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && brew upgrade
brew tap caskroom/cask 2> /dev/null
brew cask upgrade
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install bash

echo $(brew --prefix)/bin/bash | sudo tee -a /private/etc/shells
sudo chpass -s /usr/local/bin/bash $(whoami)

brew install bash-completion@2

brew install git

curl https://raw.githubusercontent.com/lyze/posh-git-sh/master/git-prompt.sh > ~/git-prompt.sh

brew install node # This will install npm as well

brew install go

brew tap d12frosted/emacs-plus
# brew install emacs-plus # install the latest version of Emacs (as of writing Emacs 27)
# brew install emacs-plus@26 [options] # install Emacs 26
# brew install emacs-plus@27 [options] # install Emacs 27
brew install emacs-plus@28 # install Emacs 28

ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications/Emacs.app

# Check for ~/.emacs.d if exists move it before cloning the code
if [ -d "$HOME/.emacs.d" ]
   then
       mv "$HOME/.emacs.d" "$HOME/.emacs.d.bak"
fi

git clone https://github.com/plexus/chemacs2.git ~/.emacs.d

# required dependencies
brew install git ripgrep
# optional dependencies
brew install coreutils fd
# Installs clang
xcode-select --install

git clone https://github.com/hlissner/doom-emacs.git ~/mydoom

brew install aspell
npm install -g marked
brew install jq
brew install shellcheck

export PATH="$HOME/go/bin:$PATH"

go install github.com/x-motemen/gore/cmd/gore@latest
go install github.com/stamblerre/gocode@latest
go install golang.org/x/tools/cmd/godoc@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/gorename@latest
go install golang.org/x/tools/cmd/guru@latest
go install github.com/cweill/gotests/gotests@latest
go install github.com/fatih/gomodifytags@latest
go install golang.org/x/tools/gopls@latest
go install mvdan.cc/sh/v3/cmd/shfmt@latest

export PATH="$HOME/mydoom/bin:$PATH"
doom install

cp -a $HOME/mydoom $HOME/backupdoom

brew install vscode
# brew cask install docker
brew install docker

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
sudo install minikube-darwin-amd64 /usr/local/bin/minikube

brew install firefox
brew install chrome

brew install slack
