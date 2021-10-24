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

# 1. Git configuration

e_header "Setup git config (global)"
link "gitignore" "~/.gitignore_global" # Adding .gitignore global
git config --global core.excludesfile "${HOME}/.gitignore_global"
git config --global user.email "jnskender@gmail.com"
git config --global user.name "jnskender"

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
  link "oh-my-zsh/alias.zsh" "$ZSH_CUSTOM/alias.zsh"
  link "oh-my-zsh/zshrc" "${HOME}/.zshrc"
fi

# 3. Install Homebrew
if test ! $(which brew); then
  e_header "Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  e_warning "Homebrew is already installed. Skipping.."
fi

brew tap Homebrew/bundle
brew bundle

# 4. Install ZSH NVM

if test ! $(which nvm); then
  e_header "Installing zsh-nvm.."

  git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

  ## To setup npm install/update -g without sudo
  link "npmrc" "~/.npmrc"
  mkdir "${HOME}/.npm-packages"
  export PATH="$HOME/.node/bin:$PATH"
  sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}

  ## Set npm global config
  npm config set init.author.name "John Skender"          ## Replace it with your name
  npm config set init.author.email "john@johnskender.com" ## Replace it with your email id
else
  e_warning "NVM is already installed. Skipping.."
fi

echo "Configuring your MacOS Settings"
sh ./mac/macos.bash
echo "MacOS settings configured"

## Print installed node, npm version
echo "node --version: $(node --version)"
echo "npm --version: $(npm --version)"

echo 'Checking for SSH key, generating one if it does not exist...'
pub=$HOME/.ssh/id_rsa.pub
[[ -f $pub ]] || ssh-keygen -t rsa -b 4096
echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_rsa" | tee ~/.ssh/config
eval "$(ssh-agent -s)"
echo "run 'pbcopy < ~/.ssh/id_rsa.pub' and paste that into GitHub"

echo "🍺  Thats all, Done. Note that some of these changes require a logout/restart to take effect."

# END
