# Start Hyprland automatically on tty1
if [ "$(tty)" = "/dev/tty1" ]; then
	if command -v hyprland >/dev/null 2>&1; then
		exec Hyprland
	else
		echo "Hyprland not found. Please install it first."
	fi
fi
