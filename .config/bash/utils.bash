ycd() {
  local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

lfcd() {
  cd "$(command lf -print-last-dir "$@")" || return
}

f() {
  if command -v yazi &>/dev/null; then
    ycd "$@"
  elif command -v lf &>/dev/null; then
    lfcd "$@"
  else
    printf "%s\n" "f: could not find yazi or lf"
  fi
}
gcp() {
  source_code="$1"
  if [[ ! -f "$source_code" ]]; then
    return 1
  fi
  out="$(basename "$source_code" .cpp)"
  mkdir -p bin >/dev/null
  g++ "$source_code" -o "./bin/$out" && "./bin/${out}"
}

cpf() {
  file="$1"
  if [[ ! -f "$file" ]]; then
    return 1
  fi
  cat "$file" | wl-copy
}
