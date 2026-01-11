export PATH="$PATH:${HOME}/.cargo/bin:${HOME}/.local/bin"

export EDITOR=nvim
export VISUAL=nvim

# Start WM automatically on tty1
if [[ "$(tty)" == "/dev/tty1" ]]; then
  if command -v sway >/dev/null 2>&1; then
    sway
  elif command -v start-hyprland >/dev/null 2>&1; then
    start-hyprland
  else
    echo "No compatible Wayland compositor found (Hyprland or sway)."
  fi
fi

[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
