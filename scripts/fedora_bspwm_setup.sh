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

# speed up dnf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf
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

# run dotfile script
bash <(curl https://raw.githubusercontent.com/iBurley/dotfiles/master/scripts/dotfiles.sh)
