#!/usr/bin/env bash
# DO NOT EDIT THIS FILE DIRECTLY!
# This file is auto generated from Applications.org

sudo apt install git

curl https://raw.githubusercontent.com/lyze/posh-git-sh/master/git-prompt.sh > ~/git-prompt.sh

wget https://dot.net/v1/dotnet-install.sh -P ./bin
export PATH=$PATH:$PWD/bin
dotnet-install.sh -c 6.0
#dotnet-install.sh -c 5.0

# Uncomment to install mono
# sudo apt install gnupg ca-certificates
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
# echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
# sudo apt update

# sudo apt install mono-complete

apt install nodejs

alias python=python3

sudo snap install go --classic

go install github.com/x-motemen/gore/cmd/gore@latest
go install github.com/stamblerre/gocode@latest
go install golang.org/x/tools/cmd/godoc@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/gorename@latest
go install golang.org/x/tools/cmd/guru@latest
go install github.com/cweill/gotests/gotests@latest
go install github.com/fatih/gomodifytags@latest

snap install emacs --classic

# The default location of the .emacs.d directory should only exist if you open emacs after installation.
if [ -d "$HOME/.emacs.d" ]
   then
       mv "$HOME/.emacs.d" "$HOME/.emacs.d.bak"
fi

git clone git@github.com:plexus/chemacs2.git ~/.emacs.d

add-apt-repository ppa:git-core/ppa
apt update
apt install git

sudo apt install ripgrep fd-find

git clone git@github.com:hlissner/doom-emacs.git ~/mydoom

apt install editorconfig
npm install -g marked
apt install jq
apt install shellcheck

export PATH="$HOME/mydoom/bin:$PATH"
doom install

cp -a $HOME/mydoom $HOME/backupdoom

sudo tar -xzf jetbrains-toolbox-1.17.7391.tar.gz -C /opt

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

sudo apt-get install -y podman

snap install slack --classic

sudo snap install discord
