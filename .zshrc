rm -f ~/.zcompdump

source ~/dotfiles/oscar_exports.zsh
source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/completions.zsh

source ~/antigen.zsh

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_MODE='nerdfont-complete'

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle colorize
antigen bundle common-aliases
antigen bundle lol
antigen bundle history
antigen bundle history-substring-search

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle scmbreeze/scm_breeze

antigen theme romkatv/powerlevel10k

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

antigen apply

DEFAULT_USER="npuljic"

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "(venv:$venv) "
}

unsetopt share_history

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home"
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
# export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode
export VISUAL="emacsclient -t" # Visual in terminal lol

# export EDITOR="vim"

export NVM_DIR="/Users/npuljic/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# for scm breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# add to path for terraform
export PATH=$PATH:~/downloads2

# Completions
autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
