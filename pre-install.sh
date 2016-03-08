#!/bin/bash

# Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]]; then
  echo 'Installing homebrew'
  # Install Homebrew
  # https://github.com/mxcl/homebrew/wiki/installation
  /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
else
  echo 'Updating homebrew'
  brew update
fi

###### BREW INSTALLS ######
brew install git  # Install Git
brew install git-secrets  # Install git-secrets
brew install vim  # Install Vim
brew install zsh  # Install Zsh
brew install youtube-dl  # InstallYoutube-dl
brew install cheat  # Install Cheat
brew install python  # Install Python
brew install python3  # Install Python3
brew install app-engine-python  # Install Google App Engine Python SDK
brew install heroku-toolbelt  # Install Heroku
brew install node  # Install Node Js
brew install tmux  # Install tmux
brew install ctags  # Install exuberant Ctags
brew install otto  # Install Otto by HashiCorp
brew install vault  # Install Vault by HashiCorp
brew install tree  # Install tree
brew install keybase  # Install Keybase
brew install gpg2  # Intall GnuPGP
brew install ruby  # Install Ruby

###### RUBY INSTALLS ######
gem install jekyll  # Install Jekyll

###### NODE INSTALLS ######
npm install -g yo  # Install Yeoman
npm install -g bower  # Install Bower
npm install -g grunt-cli  # Install GRUNT
npm install angular  # Install AngularJs
npm install bootstrap  # Install Bootstrap

# Check if oh-my-zsh is installed
OMZDIR="$HOME/.oh-my-zsh"
if [ ! -d "$OMZDIR" ]; then
  echo 'Installing oh-my-zsh'
  /bin/sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo 'Updating oh-my-zsh'
  upgrade_oh_my_zsh
fi

# Change default shell
if [! $0 = "-zsh"]; then
  echo 'Changing default shell to zsh'
  chsh -s /bin/zsh
else
  echo 'Already using zsh'
fi
