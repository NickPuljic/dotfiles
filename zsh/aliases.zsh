# Colorize grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Standard Aliases
alias ll='ls -alGFh'

function gcom() {
    git checkout main && git pull origin main
}

# NORMAL COMMAND ALIASES
function cdd() { cd ~/workspace/ ;}
function cdh() { cd ~/ ;}

# Emacs commands
function edaemon() { emacs --daemon ; }
function edaemonkill() { emacsclient -e '(kill-emacs)' ;}
function e() { emacsclient -t "$@" ; }
function ec() { emacsclient -c "$@" ; }

function notify() {alerter -message "done" -sound default ;}

function remaster() {
    local mybranch=$(git symbolic-ref --short HEAD) # puts your current branch in variable mybranch
    git checkout master && git pull --rebase # pulls the latest master and rebases any local commits you have on master on top of it
    git rebase master $mybranch -Xours # rebases your branch on top of master, choosing master's commits when there is a conflict
}

alias gsort="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
