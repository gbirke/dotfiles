set number
set linebreak
set hidden
set nobackup
set autoindent
set smartindent
set nowrap
set incsearch
set shiftwidth=4
set tabstop=4
set expandtab
set showmatch
set tabstop=4
set history=200
set display+=lastline
set laststatus=2
set backspace=eol,indent,start
set fileencodings=utf-8,latin-1,ucs-bom
set formatoptions=tcrqw
set printoptions=duplex:off,
set statusline=%<%f\ %h%m%r%=%-14.(%l,%v%)\ %P
set modeline
set modelines=3
set t_Co=256 " activate 256 colors
filetype plugin on
colorscheme blue
syntax on

" Popular command typos
command W :w
command Wq :wq
command WQ :wq
command Q :q

map <up> gk
imap <up> <C-o>gk
map <down> gj
imap <down> <C-o>gj
imap <home> <C-o>g<home>
imap <end> <C-o>g<end>

" Swap two characters (Cursor on the first char)
nmap ; "idl"ip

" Use :set list to show whitespace
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Colorscheme-Aenderungen
hi Pmenu guibg=#2050d0 guifg=#90fff0
hi MatchParen guibg=bg guifg=Red
