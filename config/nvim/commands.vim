" Remap common command typos
command! W :w
command! Wq :wq
command! WQ :wq
command! Q :q

" Commands for fast editing and reload of Nvim config
command! Config execute ":e $MYVIMRC"
command! Reload execute "source ~/.config/nvim/init.vim"

command BD :Bdelete


