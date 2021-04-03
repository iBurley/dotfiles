#!/bin/sh

# clone the repo
git clone https://github.com/iBurley/dotfiles.git .dotfiles

# chmod files
chmod 755 ~/.dotfiles/files/.config/bspwm/bspwmrc
chmod 644 ~/.dotfiles/files/.config/sxhkd/sxhkdrc

# create config directories
mkdir -p ~/.config/{alacritty,bspwm,mpv,polybar,rofi,sxhkd}
mkdir -p ~/.vim/colors

# create symbolic links
ln -s ~/.dotfiles/files/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/.dotfiles/files/.config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -s ~/.dotfiles/files/.config/mpv/mpv.conf ~/.config/mpv/mpv.conf
ln -s ~/.dotfiles/files/.config/polybar/config ~/.config/polybar/config
ln -s ~/.dotfiles/files/.config/rofi/config.rasi ~/.config/rofi/config.rasi
ln -s ~/.dotfiles/files/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -s ~/.dotfiles/files/.vimrc ~/.vimrc

# download vim colorscheme
curl -Lo ~/.vim/colors/base16-default-dark.vim "https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-default-dark.vim"
