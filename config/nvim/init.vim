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

" Set spelling dictionary
set spellfile=~/.config/nvim/spell/en.utf-8.add

" Store undo tree between sessions. Nvim stores the files in /.local/share/nvim/undo (`:help undodir´)
set undofile

" Allow project-specific .vimrc files, but restrict commands to secure ones
set exrc
set secure

" Faster updates of gitgutter and coc
set updatetime=300

" Turn on filetype plugins in .config/nvim/ftplugin
filetype plugin on

" Set leader key from \ to Space
let mapleader = " "

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

" fzf-nvalt
nmap <Leader>nv :NV<CR>

" Plugin settings
let g:deoplete#enable_at_startup = 1

" Language server for vue, needs https://www.npmjs.com/package/vue-language-server
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

" Directories of my notes
let g:nv_search_paths = [ '~/Nextcloud/Notizen' ]

call plug#begin('~/.local/share/nvim/plugged')

" Languages support
Plug 'plasticboy/vim-markdown'
Plug 'pearofducks/ansible-vim'
Plug 'HerringtonDarkholme/yats.vim' " Yet Another TypeScript Syntax
Plug 'mhartington/nvim-typescript', { 'build': './install.sh' }
Plug 'alexlafroscia/postcss-syntax.vim'
Plug 'vito-c/jq.vim'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'ekalinin/Dockerfile.vim'
Plug 'matthew-brett/vim-rst-sections'
Plug 'reasonml-editor/vim-reason-plus'

" Languages not often used (eg. Advent of code), enable if really needed
" Plug 'evanleck/vim-svelte'
" Plug 'wlangstroth/vim-racket'
" Plug 'derekwyatt/vim-scala'
" Plug 'elixir-editors/vim-elixir'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'algotech/ultisnips-php'

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

" VimWiki
Plug 'vimwiki/vimwiki'

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

" Automatically insert matching pairs for braces and quotes
Plug 'jiangmiao/auto-pairs'

" Notational Velocity
Plug 'alok/notational-fzf-vim'

" Asynchronous linting
Plug 'dense-analysis/ale'

call plug#end()	

colorscheme onedark

" Disable automated folding of markdown files
let g:vim_markdown_folding_disabled = 1


let g:ale_linters = {
	\'javascript':['eslint']
\}

runtime coc_config.vim
runtime wikiconfig.vim

" Re-enable for Scala file types
" au BufRead,BufNewFile *.sbt set filetype=scala


