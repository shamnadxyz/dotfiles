# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# To stop logging of consecutive identical commands
export HISTCONTROL=ignoredups

# Neovim default colorscheme
PS1='\n\w\n\\$ '

update_prompt() {
  local status=$?

  local dir_color sym_color

  # Blue
  dir_color='\[\e[34m\]'

  if ((status == 0)); then
    # Green
    sym_color='\[\e[32m\]'
  else
    # Red
    sym_color='\[\e[31m\]'
  fi

  PS1="\n${dir_color}\w\n${sym_color}❯ \[\e[0m\]"
}

PROMPT_COMMAND=update_prompt

shopt -s autocd
shopt -s checkwinsize
shopt -s cmdhist
shopt -s extglob
shopt -s histappend

# History
HISTSIZE=100000
HISTFILESIZE=200000

command -v zoxide &>/dev/null && eval "$(zoxide init bash)"
command -v fzf &>/dev/null && eval "$(fzf --bash)"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

[[ -f "/usr/share/doc/pkgfile/command-not-found.bash" ]] && . "/usr/share/doc/pkgfile/command-not-found.bash"
[[ -f "/usr/share/bash-completion/bash_completion" ]] && . "/usr/share/bash-completion/bash_completion"
[[ -f "${HOME}/.alias" ]] && . "${HOME}/.alias"
