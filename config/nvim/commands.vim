" Remap common command typos
command! W :w
command! Wq :wq
command! WQ :wq
command! Q :q

" Show list of config files in FZF dialog
command! Config execute ":Files ~/.config/nvim"
" Disabled for now, until we have a good way of reloading Lua modules
"command! Reload execute \"source ~/.config/nvim/init.vim"

command BD :Bdelete


