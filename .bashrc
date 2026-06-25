# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# To stop logging of consecutive identical commands
export HISTCONTROL=ignoredups

PS1='\n\w\n\\$ '

update_prompt() {
  local status=$?

  local red blue sym_color end_seq remote 

  red='\[\e[31m\]'
  blue='\[\e[34m\]'
  white='\[\e[37m\]'
  end_seq="\[\e[0m\]"

  if ((status == 0)); then
    # White
    sym_color="$white"
  else
    # Red
    sym_color="$red"
  fi


  # Display hostname if connected via ssh
  if [[ -n "$SSH_CONNECTION" ]]; then
    remote=" 󰖟 \h"
  fi


  PS1="\n\w${blue}${remote}${end_seq}\n${sym_color}\\$ ${end_seq}"
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

[[ -f "/usr/share/doc/pkgfile/command-not-found.bash" ]] && . "/usr/share/doc/pkgfile/command-not-found.bash"
[[ -f "/usr/share/bash-completion/bash_completion" ]] && . "/usr/share/bash-completion/bash_completion"
[[ -f "${HOME}/.alias" ]] && . "${HOME}/.alias"
[[ -f "${HOME}/.config/bash/fzf-pacman.bash" ]] && . "${HOME}/.config/bash/fzf-pacman.bash"
[[ -f "${HOME}/.config/bash/fzf-rsync.bash" ]] && . "${HOME}/.config/bash/fzf-rsync.bash"
[[ -f "${HOME}/.config/bash/utils.bash" ]] && . "${HOME}/.config/bash/utils.bash"
