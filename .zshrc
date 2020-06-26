source ~/dotfiles/oscar_exports.zsh
source ~/dotfiles/person_exports.zsh
source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/completions.zsh

source ~/antigen.zsh

antigen use oh-my-zsh

antigen bundle alias-finder
antigen bundle colorize
antigen bundle common-aliases
antigen bundle git
# antigen bundle git-auto-fetch
antigen bundle history
antigen bundle pip

# Must be the last normal bundle but first special bundle for highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle scmbreeze/scm_breeze
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions

antigen theme romkatv/powerlevel10k

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

antigen apply

DEFAULT_USER="npuljic"

unsetopt share_history

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
# export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode
export VISUAL="emacsclient -t" # Visual in terminal lol

# Completions
autoload -U compinit && compinit

# ZMV (renaming)
autoload -U zmv

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Bind keys for history-substring-search
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
