#!/bin/sh

# apply gnome tweaks
gsettings set org.gnome.desktop.interface clock-format 12h
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro Semibold 10'
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.gedit.preferences.editor bracket-matching false
gsettings set org.gnome.gedit.preferences.editor highlight-current-line false
gsettings set org.gnome.gedit.preferences.editor insert-spaces true
gsettings set org.gnome.gedit.preferences.editor tabs-size 2
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'standard'
gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 0
gsettings set org.gnome.shell disable-user-extensions true
gsettings set org.gtk.Settings.FileChooser sort-directories-first true

# speed up dnf
echo 'fastestmirror=true' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=20' | sudo tee -a /etc/dnf/dnf.conf

# auto-mount storage drive:
sudo mkdir /mnt/Storage/
echo 'UUID=05044ab0-bb11-47ff-b2f3-881d3bc4ac09 /mnt/Storage ext4 defaults 0 0' | sudo tee -a /etc/fstab
sudo mount -a

# set music dir to storage drive
xdg-user-dirs-update --set MUSIC /mnt/Storage/Music/

# fix font rendering:
sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'
gsettings set org.gnome.desktop.interface font-hinting 'slight'

# disable "Modular" repos:
sudo dnf -y config-manager --set-disabled *modular*

# disable cisco-openh264 repo:
sudo dnf -y config-manager --set-disabled fedora-cisco-openh264

# enable RPM Fusion repos:
sudo dnf --nogpgcheck -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf --nogpgcheck -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y groupupdate core

# install multimedia codecs:
# sudo dnf -y groupupdate Multimedia

# remove symbola font
sudo dnf -y remove gdouros-symbola-fonts
echo 'exclude=gdouros-symbola-fonts' | sudo tee -a /etc/dnf/dnf.conf

# install/remove software:
sudo dnf -y install ffmpeg fragments gnome-music mpv xclip youtube-dl
sudo dnf -y remove cheese gnome-clocks gnome-contacts gnome-maps gnome-photos gnome-tour gnome-weather mediawriter rhythmbox totem

# enable Flathub and install software:
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.valvesoftware.Steam -y
flatpak install flathub com.spotify.Client -y

# run dotfile script
bash <(curl https://raw.githubusercontent.com/iBurley/dotfiles/master/scripts/fedora_workstation_dotfiles.sh)

# update the system:
sudo dnf -y upgrade
