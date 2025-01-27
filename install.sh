#!/usr/bin/env bash
# Install Packages from pacman 
installPacmanPackages(){
  local pacmanPackages=(7zip
acpi
amd-ucode
atool
base
base-devel
bat
bc
bind
bleachbit
blueman
bluez
bluez-utils
breeze
brightnessctl
code
cpupower
dmenu
dnsmasq
docker
docker-buildx
docker-compose
dosfstools
dpkg
duf
dunst
eza
fastfetch
fd
feh
ffmpegthumbnailer
firefox
flatpak
fortune-mod
fzf
gamemode
geany
gimp
git
gobject-introspection
gparted
grub
gsimplecal
gst-plugin-pipewire
gufw
gvfs
highlight
hostapd
htop
i3blocks
i3lock
i3status
i3-wm
imagemagick
inetutils
intel-media-driver
iwd
jdk-openjdk
kitty
kubectl
lib32-sdl_image
lib32-vulkan-radeon
libpulse
libqalculate
libreoffice-fresh
libva-intel-driver
links
linux
linux-firmware
lsof
luarocks
lutris
man-db
mariadb
mediainfo
meson
minikube
monit
mpc
mpd
nano
nemo
neovim
net-tools
networkmanager
network-manager-applet
nodejs
npm
nwg-look
obs-studio
otf-comicshanns-nerd
pacman-contrib
pavucontrol
picom
pipewire
pipewire-alsa
pipewire-jack
pipewire-pulse
plocate
polkit-gnome
polybar
python-dbus-next
python-pipx
qtile
rclone
redis
reflector
rofi
rpm-tools
rtaudio
rust
scrot
smartmontools
sxhkd
thunderbird
tldr
tmux
traceroute
transmission-gtk
trash-cli
tree
ueberzug
ufw
unrar
unzip
usbutils
vi
vim
vulkan-intel
vulkan-radeon
webp-pixbuf-loader
wget
wine-staging
winetricks
wireless_tools
wireplumber
xautolock
xdg-utils
xf86-video-amdgpu
xf86-video-ati
xf86-video-nouveau
xf86-video-vmware
xorg-server
xorg-xev
xorg-xinit
xorg-xrandr
yazi
yt-dlp
zathura
zathura-pdf-mupdf
zip
zoxide
zram-generator
zsh
zsh-completions)

sudo pacman -S --needed ${pacmanPackages[@]}


}

# Install packages from AUR

installYayPackages(){
  local yayPackages=(
  ani-cli
cpupower-gui
electron29
linux-wifi-hotspot
localsend-bin
mongodb-bin
mongosh-bin
nerdfetch
papirus-folders-catppuccin-git
restfox-bin
rofi-greenclip
rustdesk-bin
tty-clock
yay
zen-browser-bin
)

yay -S --needed ${yayPackages[@]}

}

configFilesplacement(){
  find . -maxdepth 1  -type d ! -path "." !  -path "./.local" ! -path "./.git" -exec mv {} ~/.config/ \;
  
  find . -maxdepth 1 -type d -path "./.local" -exec mv {} ~/ \;

  find . -maxdepth 1  -type f -regex "^./.*" ! -name "README.md" ! -name "output.png" -exec mv {} ~/ \;

  cp ~/.config/X11/qtilexinitrc ~/.xinitrc
}

installPacmanPackages
installYayPackages
configFilesplacement
echo -e "Type 'startx' and hit enter \n system will start..."

