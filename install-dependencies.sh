#!/bin/bash
#
# Package installation Script

readonly SYSTEM_UTILS=(
  "7zip" "unzip" "rsync" "curl" "git" "stow"
  "man-db" "tealdeer" "zoxide" "fzf" "fd"
  "ripgrep" "jq" "progress" "ncdu"
  "btop" "brightnessctl" "libnotify" "reflector"
  "pkgfile" "polkit-kde-agent" "xdg-utils"
  "aria2" "bat" "keepassxc"
)

readonly HARDWARE=(
  "bluez" "bluez-utils" "networkmanager"
  "network-manager-applet" "ntfs-3g"
)

readonly HYPRLAND_ENV=(
  "hyprland" "hyprlock" "hyprshot" "waybar" "rofi" "wofi"
  "dunst" "swaybg" "grim" "slurp" "wl-clipboard"
  "nwg-look" "xdg-desktop-portal-hyprland"
  "xdg-desktop-portal-wlr"
  "qt5-wayland" "qt6-wayland" "libayatana-appindicator"
)

readonly MEDIA=(
  "pavucontrol" "pulsemixer" "mpd" "mpc" "rmpc"
  "mpv" "mpv-mpris" "mpd-mpris" "obs-studio"
  "imagemagick" "perl-image-exiftool"
  "zathura" "zathura-cb" "zathura-pdf-mupdf"
  "nsxiv"
)

readonly DEV_SHELL_TOOLS=(
  "zsh" "zsh-syntax-highlighting" "starship" "uv"
  "foot" "tmux" "neovim" "yazi" "npm" "httpie"
)

readonly APPEARANCE=(
  "noto-fonts" "noto-fonts-cjk" "noto-fonts-emoji" "noto-fonts-extra"
  "papirus-icon-theme" "orchis-theme" "ttf-hack-nerd"
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
    "${HYPRLAND_ENV[@]}"
    "${MEDIA[@]}"
    "${DEV_SHELL_TOOLS[@]}"
    "${APPEARANCE[@]}"
  )

  install_packages "${all_packages[@]}"
}

main
