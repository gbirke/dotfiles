#!/bin/sh

stow ack
stow bash
stow ctags
stow git
stow vim
stow zsh

mkdir -p ~/.config

CURDIR=`pwd`

ln -s $PWD/config/fish ~/.config/fish
ln -s $PWD/config/omf ~/.config/omf
ln -s $PWD/config/nvim ~/.config/nvim
ln -s $PWD/config/alacritty ~/.config/alacritty

