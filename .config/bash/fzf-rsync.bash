_fzf_complete_rsync() {
  _fzf_complete --multi \
    --preview "ls {}" \
    --prompt="select > " -- "$@" < <(
      ls --group-directories-first --sort=time
    )
}

complete -F _fzf_complete_rsync -o default -o bashdefault rsync
