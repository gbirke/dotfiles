" I want my Markdown to have 'hard wrap' mode on by default

setlocal textwidth=74

" Break lines while in insert mode (hard wrap)
setlocal formatoptions-=l

" Auto-Continue todo-lists, change 'comment' format options 
setlocal comments=b:>,b:*,b:+,b:-\ [\ ],b:-

" TODO Header increase and decrease shortcuts for individual headers, the ones
" below increase all levels
" nnoremap <S-RIGHT> :HeaderIncrease<CR>
" nnoremap <S-LEFT>< :HeaderDecrease<CR>

" Restore Enter-Completion for markdown files when VimWiki is active
" inoremap <expr> <CR>   pumvisible() ? "\<CR>"   : "<Esc>:VimwikiReturn 1 5<CR>"
" inoremap <silent> <buffer> <expr> <CR>   pumvisible() ? "\<CR>"   : "<Esc>:VimwikiReturn 1 5<CR>"
