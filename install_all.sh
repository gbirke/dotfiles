#!/bin/sh

stow ack
stow bat
stow bash
stow ctags
stow fish
stow git
stow jj
stow nushell
stow nvim
stow nvim-notes
stow omf
stow proselint
stow tmux
stow vale
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

# Add symlink for Vale global config
if [[ $OSTYPE == 'darwin'* ]]; then
	ln -s ~/.config/vale ~/Library/Application\ Support/vale
fi
