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
brew tap homebrew/bundle

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
