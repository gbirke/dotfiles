#!/bin/sh

stow ack
stow bash
stow ctags
stow git
stow tmux
stow vim
stow zsh

mkdir -p ~/.config

CURDIR=`pwd`

ln -s $PWD/config/alacritty ~/.config/alacritty
ln -s $PWD/config/dunst ~/.config/dunst
ln -s $PWD/config/fish ~/.config/fish
ln -s $PWD/config/nvim ~/.config/nvim
ln -s $PWD/config/omf ~/.config/omf
ln -s $PWD/config/youtube-dl ~/.config/youtube-dl
ln -s $PWD/config/sway ~/.config/sway
ln -s $PWD/config/waybar ~/.config/waybar

