#!/bin/sh

stow ack
stow bat
stow bash
stow ctags
stow fish
stow git
stow nushell
stow nvim
stow omf
stow proselint
stow tmux
stow vim
stow youtube-dl
stow yt-dlp
stow zsh

mkdir -p ~/.config

CURDIR=`pwd`

ln -s $PWD/config/alacritty ~/.config/alacritty
ln -s $PWD/config/dunst ~/.config/dunst
ln -s $PWD/config/sway ~/.config/sway
ln -s $PWD/config/waybar ~/.config/waybar

