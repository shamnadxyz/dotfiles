_fzf_complete_pacman() {
  case "$3" in
  -R*)
    _fzf_complete --multi \
      --preview "pacman -Qi {1}" \
      --prompt="remove > " -- "$@" < <(
        pacman -Qeq
      )
    ;;
  -S)
    _fzf_complete --multi \
      --preview "pacman -Si {1}" \
      --prompt="install > " -- "$@" < <(
        pacman -Slq
      )
    ;;
  esac
}

complete -F _fzf_complete_pacman -o default -o bashdefault pacman
