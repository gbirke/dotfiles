" Basic settings

" Use True color Terminal
set termguicolors 
" Set Tab width to 4 Spaces
set tabstop=4
" Set shiftwidth to 4
set shiftwidth=4
" Display line numbers in gutter
set number
" Highlight current line
set cursorline
" Proper word wrapping in soft wrap mode
set linebreak

" Change cursor to be more visible: Green block in normal mode, Red stripe in insert mode. 
hi Cursor guifg=green guibg=green
hi Cursor2 guifg=red guibg=red
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50

" Set leader key from \ to ,
let mapleader = ","

" Remap common command typos
command W :w
command Wq :wq
command WQ :wq
command Q :q

" Upward motion line-by-line, even on wrapped lines
nnoremap <down> gj
nnoremap <up> gk

" Swap two characters (Cursor on the first char)
nmap ; "idl"ip

nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'pearofducks/ansible-vim'
Plug 'qpkorr/vim-bufkill'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'airblade/vim-gitgutter'
Plug 'joshdick/onedark.vim'
Plug 'vim-scripts/upAndDown'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'dense-analysis/ale'
call plug#end()	

colorscheme onedark

" Autocommands

