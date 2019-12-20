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

" Set spelling dictionary
set spellfile=~/.vim/spell/en.utf-8.add

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

" Switch between splits more quickly
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Swap two characters (Cursor on the first char)
nmap ; "idl"ip

nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>ne :NERDTreeFocus<CR>

" Plugin settings
let g:deoplete#enable_at_startup = 1

call plug#begin('~/.local/share/nvim/plugged')

" Languages support
Plug 'plasticboy/vim-markdown'
Plug 'pearofducks/ansible-vim'
Plug 'evanleck/vim-svelte'
Plug 'wlangstroth/vim-racket'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', { 'build': './install.sh' }
Plug 'alexlafroscia/postcss-syntax.vim'

"Autocomplete/Language server
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Surround code with quotes, brackets, etc
Plug 'tpope/vim-surround'

"Git Plugin
Plug 'tpope/vim-fugitive'

" Move, Rename, Copy buffers and do other file system commands
Plug 'tpope/vim-eunuch'

" Kill buffers without closing the current window
Plug 'qpkorr/vim-bufkill'

" fzf integration
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Show contents of registers when hitting "
Plug 'junegunn/vim-peekaboo'

" Show Plus, minus and tilde signs in a gutter column to show git status"
Plug 'airblade/vim-gitgutter'

" Atom-Like theme
Plug 'joshdick/onedark.vim'

" Move Lines with Shift-<Up> and Shift-<Down>
Plug 'vim-scripts/upAndDown'

" Show filesystem tree in window
Plug 'scrooloose/nerdtree'

" Align text, see http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plug 'godlygeek/tabular'

" Asynchronous linting
Plug 'dense-analysis/ale'
call plug#end()	

colorscheme onedark

" Disable automated folding of markdown files
let g:vim_markdown_folding_disabled = 1


let g:ale_linters = {
\'javascript':['eslint']	
\}


