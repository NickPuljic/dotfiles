# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/completions.zsh
source ~/dotfiles/zsh/history.zsh

source ~/antigen.zsh

antigen use oh-my-zsh

antigen bundle alias-finder
antigen bundle colorize
antigen bundle common-aliases
antigen bundle git
antigen bundle git-auto-fetch
antigen bundle history
antigen bundle pip

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
    OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
    zle -N self-insert url-quote-magic
}

pastefinish() {
    zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes done


# Must be the last normal bundle but first special bundle for highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle scmbreeze/scm_breeze
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions

antigen theme romkatv/powerlevel10k

antigen apply

DEFAULT_USER="nicholaspuljic"

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

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
