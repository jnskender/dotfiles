!/bin/sh

[ "${SHELL##/*/}" != "zsh" ] && echo 'You might need to change default shell to zsh: `chsh -s /bin/zsh`'

dir="$HOME/Developer/personal"
mkdir -p $dir
cd $dir
git clone --recursive https://github.com/jnskender/dotfiles.git
cd dotfiles
sh etc/bootstrap.sh
