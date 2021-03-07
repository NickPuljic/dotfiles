# Colorize grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Standard Aliases
# alias la='ls -A'
# alias l='ls -CF'
# alias cp='cp -i'
# alias mv='mv -i'
# alias rm='rm -i'
# alias ll='ls -lGaFh'
alias ls='ls -al'

# Oscar Aliases from jjacob
# GITHUB ALIASES
function curr_git_branch() { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' ;}

# function gs() { git status ;}
# function ga() { git add "$@" ;}
# function gaa() { git add -A ;}

# function gpul() { git pull "$@" ;}

# function gb() { git branch "$@";}

# function gcm() { git commit -m "$1" ;}
# function gcam() { git commit -am "$1" ;}

# function gf() { git fetch ;}
#function gf() { git fetch-single-branch-and-create-local-remote-tracking-ref origin "$@" ;}

# function gco() { git checkout "$@" ;}
function gcom() {
    git checkout master
    git pull origin master
}

# NORMAL COMMAND ALIASES
# function h() { history ;}
function cdd() { cd ~/workspace ;}
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
