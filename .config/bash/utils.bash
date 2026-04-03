function y() {
  local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
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
