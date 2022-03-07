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

# chmod config files
chmod 755 ~/.dotfiles/files/.config/bspwm/bspwmrc
chmod 644 ~/.dotfiles/files/.config/sxhkd/sxhkdrc
chmod +x ~/.dotfiles/files/.config/polybar/launch.sh

# create config directories
mkdir -p ~/.config/{alacritty,bspwm,mpv,polybar,rofi,sxhkd}
mkdir -p ~/.vim/colors

# symlink config files
ln -s ~/.dotfiles/files/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.dotfiles/files/.config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -s ~/.dotfiles/files/.config/mpv/mpv.conf ~/.config/mpv/mpv.conf
ln -s ~/.dotfiles/files/.config/polybar/config ~/.config/polybar/config
ln -s ~/.dotfiles/files/.config/polybar/launch.sh ~/.config/polybar/launch.sh
ln -s ~/.dotfiles/files/.config/rofi/config.rasi ~/.config/rofi/config.rasi
ln -s ~/.dotfiles/files/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -s ~/.dotfiles/files/.vimrc ~/.vimrc

# download vim colorscheme
curl -Lo ~/.vim/colors/base16-default-dark.vim "https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-default-dark.vim"
