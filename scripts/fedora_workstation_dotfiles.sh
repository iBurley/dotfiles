#!/bin/sh

# clone the repo
git clone https://github.com/iBurley/dotfiles.git .dotfiles

# create bash alias directory
mkdir ~/.bashrc.d/

# symlink bash aliases
ln -s ~/.dotfiles/files/.bashrc.d/clrswap ~/.bashrc.d/clrswap
ln -s ~/.dotfiles/files/.bashrc.d/cp ~/.bashrc.d/cp
ln -s ~/.dotfiles/files/.bashrc.d/diff ~/.bashrc.d/diff
ln -s ~/.dotfiles/files/.bashrc.d/grep ~/.bashrc.d/grep
ln -s ~/.dotfiles/files/.bashrc.d/ls ~/.bashrc.d/ls
ln -s ~/.dotfiles/files/.bashrc.d/mv ~/.bashrc.d/mv
ln -s ~/.dotfiles/files/.bashrc.d/pkgcount ~/.bashrc.d/pkgcount
ln -s ~/.dotfiles/files/.bashrc.d/rm ~/.bashrc.d/rm
ln -s ~/.dotfiles/files/.bashrc.d/xclip ~/.bashrc.d/xclip
ln -s ~/.dotfiles/files/.bashrc.d/ytclip ~/.bashrc.d/ytclip

# re-source bashrc to enable changes
source ~/.bashrc

# create config directories
mkdir -p ~/.config/mpv

# symlink config files
ln -s ~/.dotfiles/files/.config/mpv/mpv.conf ~/.config/mpv/mpv.conf
