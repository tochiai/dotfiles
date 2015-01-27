# .bashrc
export CODEHOME="/home/tyler/Code"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
# git aliases
alias gsh="git stash"
alias gshp="git stash pop"
alias gd="git diff --color"
alias gps="git push origin"
alias gpl="git pull origin"
alias gc="git commit -m"
alias ga="git add "
alias grh="git reset HEAD"

alias sb="source ~/.bash_profile"
alias pep="pep8 --statistics --ignore=W,E126,E123 --max-line-length=100"
alias ns="nosetests -sv"
alias psd="pserve --reload development.ini"
alias ta="cd $CODEHOME/trove-api"
alias ic="cd $CODEHOME/ic-icepick"
alias gst="git status"
alias gco="git checkout"
alias gb="git branch"
alias gpod="git pull origin develop"
alias gl="git log --color"
alias gm="git merge"
alias gmd="git merge develop"
alias brc="vim ~/.bashrc"
alias ve="source $CODEHOME/trove/bin/activate"

set -o ignoreeof
