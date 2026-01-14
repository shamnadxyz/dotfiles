#!/bin/bash
#
# Package installation Script

readonly SYSTEM_UTILS=(
  "7zip" "unzip" "rsync" "curl" "git" "stow"
  "man-db" "tealdeer" "zoxide" "fzf" "fd"
  "ripgrep" "jq" "ncdu" "btop" "xdg-utils"
  "brightnessctl" "libnotify"
  "pkgfile" "polkit-kde-agent"
  "aria2" "keepassxc"
)

readonly HARDWARE=(
  "bluez" "bluez-utils"
  "networkmanager" "ntfs-3g"
)

readonly DESKTOP_ENV=(
  "waybar" "rofi" "sway" "dunst"
  "swaybg" "grim" "slurp" "wl-clipboard"
  "nwg-look" "xdg-desktop-portal-wlr"
  "qt6-wayland" "libayatana-appindicator"
)

readonly MEDIA=(
  "pulsemixer" "mpd" "mpc" "rmpc"
  "mpv" "mpv-mpris" "imagemagick"
  "perl-image-exiftool" "swayimg"
  "zathura" "zathura-cb" "zathura-pdf-mupdf"
)

readonly DEV_SHELL_TOOLS=(
  "uv" "tmux" "npm" "bash-completion"
  "foot" "neovim" "yazi"
)

readonly APPEARANCE=(
  "ttf-dejavu" "orchis-theme"
  "otf-commit-mono-nerd"
)

install_packages() {
  local -r pkg_list=("$@")

  sudo pacman -Syu

  sudo pacman -S --needed "${pkg_list[@]}"
}

main() {
  if ! command -v pacman >/dev/null 2>&1; then
    echo "Error: This script is intended for Arch Linux."
    exit 1
  fi

  local -a all_packages=(
    "${SYSTEM_UTILS[@]}"
    "${HARDWARE[@]}"
    "${DESKTOP_ENV[@]}"
    "${MEDIA[@]}"
    "${DEV_SHELL_TOOLS[@]}"
    "${APPEARANCE[@]}"
  )

  install_packages "${all_packages[@]}"
}

main
