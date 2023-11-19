" I want my Markdown to have 'hard wrap' mode on by default

setlocal textwidth=74

" Break lines while in insert mode (hard wrap)
setlocal formatoptions-=l

" Auto-Continue todo-lists, change 'comment' format options 
setlocal comments=b:>,b:*,b:+,b:-\ [\ ],b:-

" Always spell-check in markdown files
setlocal spell

