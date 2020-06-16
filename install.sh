#!/bin/bash

# Welcome!!
# Custom dotfiles to get you started with OS X machine for development.
# Author: https://github.com/gokulkrishh
# Source: https://github.com/gokulkrishh/dotfiles

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

# 1. Git configuration

e_header "Setup git config (global)"
ln -sf gitignore ~/.gitignore_global  ## Adding .gitignore global
git config --global core.excludesfile "${HOME}/.gitignore_global"
git config --global user.email "jnskender@gmail.com" ## Git Email Id
git config --global user.name "jnskender" ## Git Username

# 2. Install Oh-My-Zsh & custom aliases

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
  e_header "Copying ZSH themes & aliases..."
  e_note "Check .aliases file for more details."
  ln -sf oh-my-zsh/aliases ~/.aliases                                        ## Copy aliases
  ln -sf oh-my-zsh/zshrc ~/.zshrc                                            ## Copy zshrc configs
fi

# 3. Install Homebrew

if test ! $(which brew); then
  e_header "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap Homebrew/bundle
  brew bundle
else
  e_warning "Homebrew is already installed. Skipping.."
fi


# 4. Install ZSH NVM

if test ! $(which nvm); then
  e_header "Installing zsh-nvm.."

  git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

  ## To setup npm install/update -g without sudo
  ln -sf  npmrc ~/.npmrc
  mkdir "${HOME}/.npm-packages"
  export PATH="$HOME/.node/bin:$PATH"
  sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}

  ## Set npm global config
  npm config set init.author.name "John Skender" ## Replace it with your name
  npm config set init.author.email "jnskender@gmail.com" ## Replace it with your email id
else
  e_warning "NVM is already installed. Skipping.."
fi

echo "Configuring your MacOS Settings"
sh ./macos.bash
echo "MacOS settings configured"

## Print installed node, npm version
echo "node --version: $(node --version)"
echo "npm --version: $(npm --version)"

echo "Generating an RSA token for GitHub"
ssh-keygen -t rsa -b 4096 -C "jnskender@gmail.com" ## Replace it with your email id
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_rsa" | tee ~/.ssh/config
eval "$(ssh-agent -s)"
echo "run 'pbcopy < ~/.ssh/id_rsa.pub' and paste that into GitHub"




echo "🍺  Thats all, Done. Note that some of these changes require a logout/restart to take effect."

# END
