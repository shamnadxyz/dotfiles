# To stop logging of consecutive identical commands
export HISTCONTROL=ignoredups

PS1='\n\[\e[1;38;2;180;190;254m\]\w\n\[\e[38;2;137;180;250m\]\u\[\e[38;2;205;214;244m\] \$ \[\e[0m\]'

update_prompt() {
  local status=$?

  local dir_color user_color sym_color

  # Lavender
  dir_color='\[\e[1;38;2;180;190;254m\]'
  # Blue
  user_color='\[\e[38;2;137;180;250m\]'

  if ((status == 0)); then
    # Green
    # sym_color='\[\e[38;2;166;227;161m\]'

    # Text
    sym_color='\[\e[38;2;205;214;244m\]'

  else
    # Red
    sym_color='\[\e[38;2;243;139;168m\]'
  fi

  PS1="\n${dir_color}\w\n${user_color}\u${sym_color} \$ \[\e[0m\]"
}

PROMPT_COMMAND=update_prompt

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

[[ -f "/usr/share/doc/pkgfile/command-not-found.bash" ]] && . "/usr/share/doc/pkgfile/command-not-found.bash"
[[ -f "/usr/share/bash-completion/bash_completion" ]] && . "/usr/share/bash-completion/bash_completion"
[[ -f "${HOME}/.alias" ]] && . "${HOME}/.alias"
