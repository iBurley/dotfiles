#!/bin/sh

# add aliases:
mkdir ~/.bashrc.d/
chmod 700 ~/.bashrc.d/
echo "alias clrswap='sudo swapoff -a && sudo swapon -a'" | tee ~/.bashrc.d/clrswap
echo "alias cp='cp -iv'" | tee ~/.bashrc.d/cp
echo "alias diff='diff --color=auto'" | tee ~/.bashrc.d/diff
echo "alias grep='grep --color=auto'" | tee ~/.bashrc.d/grep
echo "alias ls='ls --color=auto --group-directories-first'" | tee ~/.bashrc.d/ls
echo "alias mv='mv -iv'" | tee ~/.bashrc.d/mv
echo "alias pkgcount='dnf list installed | wc -l'" | tee ~/.bashrc.d/pkgcount
echo "alias rm='rm -iv'" | tee ~/.bashrc.d/rm
cat << 'EOF' >> ~/.bashrc.d/xclip
alias xcopy='xclip -i -selection clipboard'
alias xpaste='xclip -o -selection clipboard'
EOF
cat << 'EOF' >> ~/.bashrc.d/ytclip
ytclip () {
  ffmpeg -i "$(youtube-dl -f best -g "$3")" -ss $1 -to $2 -async 1 ~/Videos/clip.mp4
}
EOF
source ~/.bashrc

# apply gnome tweaks
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"
gsettings set org.gnome.desktop.interface clock-format 12h
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro Semibold 10'
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.gedit.preferences.editor bracket-matching false
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line false
gsettings set org.gnome.gedit.preferences.editor insert-spaces true
gsettings set org.gnome.gedit.preferences.editor scheme 'tango'
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
echo 'UUID=c315dd89-cf9a-44f7-ad3a-259f5062d085 /mnt/Storage ext4 defaults 0 0' | sudo tee -a /etc/fstab
sudo mount -a

# set music dir to storage drive
xdg-user-dirs-update --set MUSIC /mnt/Storage/Music/

# fix font rendering:
sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'rgba'
gsettings set org.gnome.settings-daemon.plugins.xsettings hinting 'slight'

# remove symbola font
sudo dnf -y remove gdouros-symbola-fonts
echo 'exclude=gdouros-symbola-fonts' | sudo tee -a /etc/dnf/dnf.conf

# disable "Modular" repos:
sudo dnf -y config-manager --set-disabled *modular*

# disable cisco-openh264 repo:
sudo dnf -y config-manager --set-disabled fedora-cisco-openh264

# enable RPM Fusion repos:
sudo dnf --nogpgcheck -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf --nogpgcheck -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y groupupdate core

# install multimedia codecs:
sudo dnf -y groupupdate Multimedia

# install/remove software:
sudo dnf -y install ffmpeg fragments gnome-music mpv xclip youtube-dl
sudo dnf -y remove cheese gnome-clocks gnome-contacts gnome-maps gnome-photos gnome-weather rhythmbox totem

# enable Flathub and install software:
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.valvesoftware.Steam -y
flatpak install flathub com.spotify.Client -y

# update the system:
sudo dnf -y upgrade
