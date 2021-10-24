#!/bin/sh
source helper/utility.sh

dev="$HOME/Developer"
dotfiles="$dev/personal/dotfiles"

echo ""
if [ -d "$dotfiles" ]; then
  e_header "Symlinking dotfiles from $dotfiles"
else
  e_warning "$dotfiles does not exist"
  exit 1
fi

link() {
  from="$1"
  to="$2"
  echo "Linking '$from' to '$to'"
  rm -f "$to"
  ln -s "$from" "$to"
}

link $dotfiles/git/gitignore $HOME/.gitignore_global
link $dotfiles/git/gitconfig $HOME/.gitconfig
link $dotfiles/oh-my-zsh/alias $HOME/.oh-my-zsh/custom/alias.zsh
link $dotfiles/oh-my-zsh/zshrc $HOME/.zshrc
link $dotfiles/npm/npmrc $HOME/.npmrc
