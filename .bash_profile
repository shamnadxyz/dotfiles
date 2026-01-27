export PATH="$PATH:${HOME}/.cargo/bin:${HOME}/.local/bin"

export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}

export EDITOR=nvim
export VISUAL=nvim

# Start WM automatically on tty1
if [[ "$(tty)" == "/dev/tty1" ]]; then
  if command -v sway >/dev/null 2>&1; then
    exec sway
  elif command -v start-hyprland >/dev/null 2>&1; then
    exec start-hyprland
  else
    echo "No compatible Wayland compositor found (Hyprland or sway)."
  fi
fi

[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
