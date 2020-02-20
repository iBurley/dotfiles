#!/bin/sh

# add aliases:
cat << 'EOF' >> ~/.bashrc
alias pkgcount='dnf list installed | wc -l'
alias clrswap='sudo swapoff -a && sudo swapon -a'

ytclip () {
  ffmpeg -i "$(youtube-dl -f best -g "$3")" -ss $1 -to $2 -async 1 ~/Videos/clip.mp4
}

vibrance () {
  if [[ $(nvidia-settings -q "DigitalVibrance" | grep "Attribute.*512\.") ]] 
  then
    nvidia-settings -a "DigitalVibrance=0" > /dev/null
    echo "Vibrance Disabled"
  else
    nvidia-settings -a "DigitalVibrance=512" > /dev/null
    echo "Vibrance Enabled"
  fi
}
EOF
source ~/.bashrc

# apply gnome tweaks
gsettings set org.gnome.desktop.interface clock-format 12h
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface monospace-font-name 'Source Code Pro Semibold 10'
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.privacy remember-recent-files false
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor display-overview-map true
gsettings set org.gnome.gedit.preferences.editor insert-spaces true
gsettings set org.gnome.gedit.preferences.editor scheme 'tango'
gsettings set org.gnome.gedit.preferences.editor tabs-size uint32 2
gsettings set org.gnome.nautilus.icon-view default-zoom-level 'standard'
gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 0
gsettings set org.gtk.Settings.FileChooser sort-directories-first true

# speed up dnf
echo 'fastestmirror=true' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=20' | sudo tee -a /etc/dnf/dnf.conf

# set swappiness value to 10
echo 'vm.swappiness = 10' | sudo tee -a /etc/sysctl.d/10-swappiness.conf
sudo sysctl --system

# auto-mount storage drive:
sudo mkdir /mnt/Storage/
echo 'UUID=a4b0ce89-01ec-4964-aeaf-be0d2b6a2ab3 /mnt/Storage ext4 defaults 0 0' | sudo tee -a /etc/fstab
sudo mount -a

# symlink music from storage drive
ln -s /mnt/Storage/Music/ ~/Music/

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

# enable RPM Fusion repos:
sudo dnf --nogpgcheck -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf --nogpgcheck -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y groupupdate core

# install multimedia codes:
sudo dnf -y groupupdate Multimedia

# install/remove software:
sudo dnf -y install ffmpeg ffmpeg-libs mpv youtube-dl gnome-music transmission-gtk xorg-x11-drv-nvidia akmod-nvidia discord steam
sudo dnf -y remove gnome-maps gnome-photos rhythmbox gnome-weather cheese gnome-clocks gnome-contacts gnome-documents totem gdouros-symbola-fonts

# enable Flathub and install software:
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client -y

# update the system:
sudo dnf -y upgrade
