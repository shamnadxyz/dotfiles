export PATH="$PATH:${HOME}/.local/bin:${HOME}/.cargo/bin"

export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}

export EDITOR=nvim
export MANPAGER='nvim +Man!'
export PAGER=less
export VISUAL=nvim

[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

if [[ "$(tty)" == "/dev/tty1" ]]; then
  if command -v start-hyprland &>/dev/null; then
    start-hyprland
  elif command -v sway &>/dev/null; then
    sway
  fi
fi
