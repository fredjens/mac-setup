#!/bin/bash

echo Install Mac App Store apps first.

rub - e "xcode-select --install"

# Either use mas-cli (https://github.com/argon/mas) or install manually; 
# apps I need: Bear/Simplenote, Tyme, Polarr, Pixelmator, JPEGmini.
read -p "Press any key to continue… " -n1 -s
echo '\n'

# Check that Homebrew is installed and install if not
if test ! $(which brew)
then
  echo " Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

# Update any existing homebrew recipes
brew update

# Upgrade any already installed formulae
brew upgrade --all

# Install my brew packages
brew install wget
brew install mpv

# Install cask
brew tap phinze/homebrew-cask

# Install desired cask packages
brew cask install 1password
brew cask install alfred
brew cask install dropbox
brew cask install visual-studio-code
brew cask install sketch
brew cask install slack

# Remove brew cruft
brew cleanup

# Remove cask cruft
brew cask cleanup

# Link alfred to apps
brew cask alfred link