# Start WM automatically on tty1
if [ "$(tty)" = "/dev/tty1" ]; then
  if command -v Hyprland >/dev/null 2>&1; then
    exec Hyprland
  elif command -v sway >/dev/null 2>&1; then
    exec sway
  else
    echo "No compatible Wayland compositor found (Hyprland or sway)."
  fi
fi
