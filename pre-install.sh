#!/bin/bash

# Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
  echo 'Installing homebrew'
  # Install Homebrew
  # https://github.com/mxcl/homebrew/wiki/installation
  /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
else
  echo 'Updating homebrew'
  brew update
fi

# Check if Git is installed
# which -s git || brew install git
brew install git

# Check if Zsh is installed
which -s zsh || brew install zsh

# Check if Youtube-dl is installed
which -s youtube-dl || brew install youtube-dl

# Check if Cheat is installed
which -s cheat || brew install cheat

# Install python
brew install python

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
chsh -s /bin/zsh
