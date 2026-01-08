# To stop logging of consecutive identical commands
export HISTCONTROL=ignoredups

shopt -s autocd
shopt -s checkwinsize
shopt -s cmdhist
shopt -s histappend

# History
HISTSIZE=100000

command -v starship &>/dev/null && eval "$(starship init bash)"
command -v zoxide &>/dev/null && eval "$(zoxide init bash)"
command -v fzf &>/dev/null && eval "$(fzf --bash)"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

[[ -f "/usr/share/doc/pkgfile/command-not-found.zsh" ]] && . "/usr/share/doc/pkgfile/command-not-found.zsh"
[[ -f "/usr/share/bash-completion/bash_completion" ]] && . "/usr/share/bash-completion/bash_completion"
[[ -f "${HOME}/.alias" ]] && . "${HOME}/.alias"
