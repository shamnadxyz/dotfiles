export PATH="$PATH:${HOME}/.cargo/bin:${HOME}/.local/bin"

export EDITOR=nvim
export VISUAL=nvim

# Start WM automatically on tty1
if [[ "$(tty)" == "/dev/tty1" ]]; then
  if command -v start-hyprland >/dev/null 2>&1; then
    start-hyprland
  elif command -v sway >/dev/null 2>&1; then
    sway
  else
    echo "No compatible Wayland compositor found (Hyprland or sway)."
  fi
fi

if [ -f "${HOME}/.bashrc" ]; then
  . "${HOME}/.bashrc"
fi
