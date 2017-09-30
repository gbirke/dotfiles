#!/bin/sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ ! -f ~/.vimrc ] ; then
    cp ~/.dotfiles/vim-plug/.vimrc ~/.vimrc
elif ! grep -q "plug#begin" ~/.vimrc ; then
    echo <<EOF
.vimrc needs the following lines:

call plug#begin()
Plug 'tpope/vim-sensible'
call plug#end()
EOF

fi

echo "now start vim with 'vim -c PlugInstall'"
