export PATH="$PATH:${HOME}/.cargo/bin:${HOME}/.local/bin"

export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}

export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export WM=Hyprland

# Start WM automatically on tty1
if [[ "$(tty)" == "/dev/tty1" ]]; then
  case "$WM" in
    Hyprland)
      command -v start-hyprland &>/dev/null \
        && start-hyprland
      ;;
    sway) 
      command -v sway &>/dev/null \
        && sway
      ;;
  esac
fi

[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
