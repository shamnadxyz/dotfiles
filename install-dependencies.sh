#!/bin/bash
#
# Package installation Script

readonly SYSTEM_UTILS=(
  "7zip" "unzip" "rsync" "wget" "curl" "git" "stow"
  "man-db" "tealdeer" "zoxide" "fzf" "skim" "fd"
  "ripgrep" "eza" "jq" "progress" "ncdu"
  "btop" "brightnessctl" "libnotify" "reflector"
  "pkgfile" "polkit-kde-agent" "xdg-utils"
  "aria2"
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
  "mpv" "mpv-mpris" "obs-studio"
  "imagemagick" "perl-image-exiftool"
  "zathura" "zathura-cb" "zathura-pdf-mupdf"
  "nsxiv"
)

readonly DEV_SHELL_TOOLS=(
  "zsh" "zsh-syntax-highlighting" "starship"
  "foot" "tmux" "neovim" "yazi" "npm"
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
  # Check if running on an Arch-based system
  if [[ ! -f /etc/arch-release ]]; then
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
