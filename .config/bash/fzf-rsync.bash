_fzf_complete_rsync() {
  _fzf_complete --multi \
    --preview "\ls --color=never --indicator-style=classify --group-directories-first -- {}" \
    --prompt="select > " -- "$@" < <(
      \ls --group-directories-first --sort=time
    )
}

complete -F _fzf_complete_rsync -o default -o bashdefault rsync
