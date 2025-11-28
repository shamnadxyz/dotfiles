# Other XDG paths
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"

# Session
export QT_QPA_PLATFORM="wayland"
export XDG_CURRENT_DESKTOP="Hyprland"
export XDG_SESSION_DESKTOP="Hyprland"
export XDG_SESSION_TYPE="wayland"
export GDK_BACKEND="wayland,x11"
export MOZ_ENABLE_WAYLAND=1

# Scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_ENABLE_HIGHDPI_SCALING=0
export QT_SCALE_FACTOR=1.0
export GDK_SCALE=1.0
export GDK_DPI_SCALE=1.0

# Default Apps
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export BROWSER="brave-browser"
export VISUAL="nvim"
export TERMINAL="foot"
export VIDEO="mpv"
export IMAGE="nsxiv"
export OPENER="xdg-open"
export WM="Hyprland"
export PAGER="less"

# Path
typeset -U path PATH
path=("$HOME/scripts" "$HOME/.cargo/bin/" "$HOME/.local/bin" "/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin") 
export PATH
