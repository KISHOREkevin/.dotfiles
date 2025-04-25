#!/usr/bin/env bash

pacmanPackages=(
  7zip 
  acpi
  ani-cli
  bat
  base-devel
  bleachbit
  blueman
  bluez
  brightnessctl
  cowsay
  docker
  docker-compose
  dnsmasq
  dunst
  eza
  ffmpeg
  flatpak
  flameshot
  fastfetch
  fzf
  fortune-mod
  gamemode
  gparted
  gufw
  geany
  htop
  i3lock
  iputils
  kitty
  localsend-bin
  libreoffice-fresh
  mpc
  mpd
  mpv
  mongodb-bin
  mongosh-bin
  nemo
  neovim
  nerdfetch
  net-tools
  nodejs
  npm
  nwg-look
  obs-studio
  picom
  polkit-qt6
  qtile
  rclone
  rofi
  rofi-greenclip
  scrot
  speedtest-cli
  sxhkd
  sxiv
  tldr
  transmission-gtk
  trash-cli
  ttf-jetbrains-mono-nerd
  tty-clock
  ufw
  unrar
  unzip
  vim
  vulkan-radeon
  vulkan-intel
  wget
  xwallpaper
  xautolock
  zathura
  xclip
  xorg-xgamma
  zathura-pdf-mupdf
  zen-browser-bin
  zip
  zoxide
  zsh
  zsh-completions
  )

flatpakPackages=(
  com.github.tchx84.Flatseal
  dev.restfox.Restfox
  md.obsidian.Obsidian
  org.kde.kdenlive
)

installSystemPackages(){
  yay -S ${pacmanPackages[@]} --needed --noconfirm 
}

installFlatpakPackages(){
  flatpak install ${flatpakPackages[@]}
}

configFilesplacement(){
  find . -maxdepth 1  -type d ! -path "." !  -path "./.local" ! -path "./.git" -exec mv {} ~/.config/ \;
  
  find . -maxdepth 1 -type d -path "./.local" -exec mv {} ~/ \;

  find . -maxdepth 1  -type f -regex "^./.*" ! -name "README.md" ! -name "output.png" -exec mv {} ~/ \;

  cp ~/.config/X11/qtilexinitrc ~/.xinitrc
}

installSystemPackages
installFlatpakPackages
configFilesplacement
echo -e "Type 'startx' and hit enter \n system will start..."
