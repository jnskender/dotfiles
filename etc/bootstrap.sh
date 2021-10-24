#!/bin/bash

## Custom color codes & utility functions
source helper/utility.sh

# Welcome msg

e_bold "${tan}┌──────────────────────────────────────────────────────────────┐
|                                                              |
| Welcome!!                                                    |
|                                                              |
| Setup your OS X machine for web development at ease.         |
|                                                              |
| Author: https://github.com/gokulkrishh                       |
|                                                              |
└──────────────────────────────────────────────────────────────┘"

e_header "We just need your sudo password once"
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

ZSH=~/.oh-my-zsh
if [ -d "$ZSH" ]; then
  e_warning "Oh My Zsh is already installed. Skipping.."
else
  e_header "Installing Oh My Zsh..."
  curl -L http://install.ohmyz.sh | sh
  ## install ZSH plugins
  #Z
  e_header "Installing ZSH Plugins"
  git clone https://github.com/agkozak/zsh-z $ZSH/plugins/zsh-z
  ## To install ZSH themes & aliases
  e_header "ZSH installed"
fi

# 3. Install Homebrew
if test ! $(which brew); then
  e_header "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  e_warning "Homebrew is already installed. Skipping.."
fi

e_header "Installing/Updating homebrew bundle..."
brew tap Homebrew/bundle
brew bundle

## Print installed node, npm version
echo "node --version: $(node --version)"
echo "npm --version: $(npm --version)"

e_header "Symlinking dotfiles..."
source etc/symlink-dotfiles.sh
echo "Finished symlinking"

e_header 'Checking for SSH key'
sshkey=$HOME/.ssh/id_rsa.pub
if [[ -f $sshkey ]]; then
  e_warning "SSH key already exists. Skipping..."
else
  e_warning "SSH Key didn't exist. Creating one now..."
  ssh-keygen -t rsa -b 4096
  echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_rsa" | tee ~/.ssh/config
  eval "$(ssh-agent -s)"
  echo 'Copying public key to clipboard. Paste it into your Github account...'
  [[ -f "$sshkey" ]] && cat $sshkey | pbcopy
  open 'https://github.com/account/ssh'
fi

e_header "Configuring your MacOS Settings"
source ./mac/macos.sh
echo "MacOS settings configured"

e_header "All finished! Note that some of these changes require a logout/restart to take effect."

# END
