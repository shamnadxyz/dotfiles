# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# To stop logging of consecutive identical commands
export HISTCONTROL=ignoredups

# Neovim default colorscheme
PS1='\n\[\e[1;38;2;224;226;234m\]\w\n\[\e[38;2;166;219;255m\]\u\[\e[38;2;224;226;234m\] \$ \[\e[0m\]'

update_prompt() {
  local status=$?

  local dir_color user_color sym_color

  # Lavender
  dir_color='\[\e[1;224;226;234;254m\]'
  # Blue
  user_color='\[\e[38;2;166;219;255m\]'

  if ((status == 0)); then
    # Green
    # sym_color='\[\e[38;2;179;246;192m\]'

    # Text
    sym_color='\[\e[38;2;224;226;234m\]'

  else
    # Red
    sym_color='\[\e[38;2;255;192;185m\]'
  fi

  PS1="\n${dir_color}\w\n${user_color}\u${sym_color} \$ \[\e[0m\]"
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
