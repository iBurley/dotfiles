#!/bin/sh

# speed up dnf
echo 'fastestmirror=true' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=20' | sudo tee -a /etc/dnf/dnf.conf

# fix font rendering:
sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/

# disable "Modular" repos:
sudo dnf -y config-manager --set-disabled *modular*

# disable cisco-openh264 repo:
sudo dnf -y config-manager --set-disabled fedora-cisco-openh264

# enable RPM Fusion repos:
sudo dnf --nogpgcheck -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf --nogpgcheck -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install/remove software:
sudo dnf -y install adobe-source-code-pro-fonts alacritty bspwm ffmpeg firefox fontawesome-fonts git mesa-dri-drivers mpv polkit polybar pulseaudio ranger rofi sxhkd sxiv vim-enhanced w3m-img xclip xdg-user-dirs xorg-x11-server-Xorg xorg-x11-xinit xrandr xsetroot youtube-dl

# set up xdg dirs
xdg-user-dirs-update

# update the system:
sudo dnf -y upgrade
