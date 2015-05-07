export PS1='\[\e[5;38;35m\]\D{%m/%d} \t \u@\h \W\[\e[m\] '
echo 'bashrc'
export CODEHOME="/home/tyler/Code"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
# git aliases
alias gsh="git stash"
alias gshp="git stash pop"
alias gpl="git pull origin"
alias gc="git commit -m"
alias ga="git add "
alias grh="git reset HEAD"

alias sb="source ~/.bash_profile"
alias pep="pep8 --statistics --ignore=W,E126,E123 --max-line-length=100"
alias ns="nosetests -sv"
alias nsp="nosetests --pdb -sv"
alias psd="pserve --reload development.ini"
alias ta="cd $CODEHOME/trove-api"
alias ic="cd $CODEHOME/ic-icepick/server"
alias gd="git diff"
alias gf="git fetch"
alias gst="git status"
alias gco="git checkout"
alias gb="git branch"
alias gpod="git pull origin develop"
alias gl="git log --color"
alias gm="git merge"
alias gmd="git merge develop"
alias brc="vim ~/.bashrc"
alias vrc="vim ~/.vimrc"
alias ve="source $CODEHOME/trove/bin/activate"
alias x="exit"
alias sd="screen -d"
alias sr="screen -r"
set -o ignoreeof
export EDITOR="vim"
export VISUAL="vim"

function gps {
    export BRANCH=$(git rev-parse --abbrev-ref HEAD)
    if [ "$BRANCH" == "develop" ];
    then
        echo "guessing you don't want to push to develop"
    else
        git push -u origin $BRANCH
    fi
}
function gca {
    export BRANCH=$(git rev-parse --abbrev-ref HEAD)
    if [ "$BRANCH" == "develop" ];
    then
        echo "guessing you don't want to commit to develop"
    else
        git commit -am "$1"
    fi
}
ve
stty -ixon
