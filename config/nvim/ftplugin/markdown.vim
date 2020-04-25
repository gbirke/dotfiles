" I want my Markdown to have 'hard wrap' mode on by default

" 90 is a good width for my usual terminal size
setlocal textwidth=90

" Break lines while in insert mode (hard wrap)
setlocal formatoptions-=l

" TODO Header increase and decrease shortcuts for individual headers, the ones
" below increase all levels
" nnoremap <S-RIGHT> :HeaderIncrease<CR>
" nnoremap <S-LEFT>< :HeaderDecrease<CR>

