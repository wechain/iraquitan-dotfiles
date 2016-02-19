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

# Check if Git is installed
# which -s git || brew install git
brew install git

# Install git-secrets
brew install git-secrets

# Install homebrew vim
brew install vim

# Check if Zsh is installed
which -s zsh || brew install zsh

# Check if Youtube-dl is installed
which -s youtube-dl || brew install youtube-dl

# Check if Cheat is installed
which -s cheat || brew install cheat

# Install python
brew install python

# Install tmux
brew install tmux

# Install exuberant Ctags
brew install ctags

# Install Otto by HashiCorp
brew install otto

# Install Vault by HashiCorp
brew install vault

# Install tree
brew install tree

# Install Keybase
brew install keybase

# Intall GnuPGP
brew install gpg2

# Install Watson for time tracking on projects
brew install watson

# Install Googler terminal search
brew install googler

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
