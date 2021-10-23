# Author: https://github.com/gokulkrishh

# 1. GIT

## GIT
alias s="git status"
alias grm="git rebase -i origin/master"
alias grc="git rebase --continue"
alias gra="git rebase --abort"

# GitHub Contributors List
function gclist() {
	npx github-contributors-list --owner "$1" --repo "$2" --cols 6 --sortOrder desc --showlogin true --imagesize "117" --filter gitter-badger | pbcopy
	echo "✅  Copied!"
}

# Clone and cd into cloned repo and do yarn install 😬
function clone() {
	git clone --depth=1 $1
	cd $(basename ${1%.*})
	yarn install
}

# Delete git branch in local & remote
function gbd {
	# Branch name present?
	if [[ -z "$1" ]]; then
		echo "\n🤔 Oops… you forgot to provide the branch name"
		echo "👉 E.g. gbdel branch_name\n"
	else
		echo "\n⏳ Deleting…\n"
		git branch -D "$1" # Local delete.
		git push origin --delete "$1" # Remote delete.
		echo "\n✅ Git branch $1 was deleted from local and remote.\n"
	fi
}

# Delete all branches in git local except master
alias gdbl="git branch | grep -v "master" | xargs git branch -"

# 2. Easy Navigation

## Shorcut navigations
alias c="clear"
alias o="open"
alias oo="open ."
alias ..="cd .."
alias ...="cd ../.."
alias -- -="cd -"

## Make dir and cd into it
alias mkd="mkdir -p "$@" && cd "$_";"

# 3. Tools & Utilities

## Finder
alias f="open -a Finder"
alias la="alias | sed 's/=.*//'"
alias lsd='ls -l | grep "^d"' # only directories
alias fs="stat -f \"%z bytes\"" # File size
alias lsh="ls -a" #show hidden files

#Show and hide hidden files in finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias show_hidden="defaults write com.apple.Finder AppleShowAllFiles true; killall Finder"
alias hide_hidden="defaults write com.apple.Finder AppleShowAllFiles false; killall Finder"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
## Delete & Cleanup
alias rm="=rm -rf"
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

## IP Address
alias ip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

## Capture Screenshot
alias sca="screencapture -c -W -P"

# 4. OS X Utilities

## Log Off
alias logoff="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

## Empty trash
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

## ZIP folder without hidden files
alias zip="zip -x *.DS_Store -x *__MACOSX* -x *.AppleDouble*"

## To kill all chrome tabs
alias kt="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

## List all files colorized in long format
alias l='ls -l ${colorflag}'

## Lock screen while going AFK
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"


# 5. Web Development

## Editor
alias st="open -a 'Sublime Text'"
alias at="open -a 'Atom'"

## Chrome aliases
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"

## Local server using python httpServer
alias server='python -m SimpleHTTPServer' # To start a local server

## To update brew, npm, gem and their installed packages
alias update='brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'

## NPM
alias ni="npm install"
alias ns="npm start"
alias nt="npm test"
alias dnm="rm -rf node_modules"

## NPM RUN <anything>
function nr() {
	npm run $@
}

## Yarn
alias ys="yarn start"
alias ya="yarn add"
alias yag="yarn global add"

## END
