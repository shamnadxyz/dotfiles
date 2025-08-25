# Arch Linux Dotfiles

## Installation

### Install packages

```bash
sudo pacman -S --needed 7zip aria2 brightnessctl btop dunst eza fd foot git \
             grim hyprland hyprlock libayatana-appindicator libnotify man-db \
             mpc mpd mpv mpv-mpris ncdu neovim noto-fonts noto-fonts-cjk \
             noto-fonts-emoji noto-fonts-extra npm nsxiv ntfs-3g nwg-look \
             orchis-theme papirus-icon-theme pkgfile progress pulsemixer \
             qt5-wayland rmpc rsync skim slurp starship stow swaybg \
             tree-sitter-cli ttf-hack-nerd unzip waybar wl-clipboard wofi \
             wtype xdg-desktop-portal-hyprland xdg-desktop-portal-wlr \
             yazi zathura zathura-cb zathura-pdf-mupdf zoxide zsh \
             zsh-syntax-highlighting
```

### Clone the repository

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### Deploy configurations

```bash
stow .
```

### Set zsh as default shell

#### Locate zsh file path and append to /etc/shells

```sh
command -v zsh | sudo tee -a /etc/shells
```

#### Set zsh as default

```sh
sudo chsh -s $(which zsh) $USER
```

#### Create dirstack file

```sh
touch $HOME/.cache/dirs
```
