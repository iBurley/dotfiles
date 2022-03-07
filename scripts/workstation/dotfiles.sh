#!/bin/sh

# create bash alias directory
mkdir ~/.bashrc.d/
chmod 700 ~/.bashrc.d/

# symlink bash aliases
ln -s ~/.dotfiles/files/.bashrc.d/clrswap ~/.bashrc.d/clrswap
ln -s ~/.dotfiles/files/.bashrc.d/cp ~/.bashrc.d/cp
ln -s ~/.dotfiles/files/.bashrc.d/diff ~/.bashrc.d/diff
ln -s ~/.dotfiles/files/.bashrc.d/grep ~/.bashrc.d/grep
ln -s ~/.dotfiles/files/.bashrc.d/ls ~/.bashrc.d/ls
ln -s ~/.dotfiles/files/.bashrc.d/mv ~/.bashrc.d/mv
ln -s ~/.dotfiles/files/.bashrc.d/pkgcount ~/.bashrc.d/pkgcount
ln -s ~/.dotfiles/files/.bashrc.d/rm ~/.bashrc.d/rm
ln -s ~/.dotfiles/files/.bashrc.d/xcopy ~/.bashrc.d/xcopy
ln -s ~/.dotfiles/files/.bashrc.d/xpaste ~/.bashrc.d/xpaste
ln -s ~/.dotfiles/files/.bashrc.d/ytclip ~/.bashrc.d/ytclip

# create config directories
mkdir -p ~/.config/mpv

# symlink config files
ln -s ~/.dotfiles/files/.config/mpv/mpv.conf ~/.config/mpv/mpv.conf
