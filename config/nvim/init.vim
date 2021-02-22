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
command! W :w
command! Wq :wq
command! WQ :wq
command! Q :q

" Commands for fast editing and reload of Nvim config 
command! Config execute ":e $MYVIMRC"
command! Reload execute "source ~/.config/nvim/init.vim"

" Upward motion line-by-line, even on wrapped lines
nnoremap <down> gj
nnoremap <up> gk

" Delete search highlight with backspace
nnoremap <BS> :nohlsearch<CR>

" Switch between splits more quickly
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Swap two characters (Cursor on the first char)
nmap <Leader>, "sdl"sp

nmap <Leader>b :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>ne :NERDTreeFocus<CR>
" Show current file in NERDTree
nmap <Leader>nf :NERDTreeFind<CR>

" fzf-nvalt
nmap <Leader>nv :NV<CR>

" Plugin settings

" Highlight typescript sections
let g:vim_vue_plugin_use_typescript = 1

" Language server for vue, needs https://www.npmjs.com/package/vue-language-server
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

" Specify CoC extensions that should always exist
let g:coc_global_extensions = ['coc-json', 'coc-rls']

" Directories of my notes
let g:nv_search_paths = [ '~/Nextcloud/Notizen' ]

" Disable BufKill mappings of leader key beginning with b, to speed up fzf
" buffer switch
let g:BufKillCreateMappings = 0

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
Plug 'amiralies/vim-rescript'
Plug 'dag/vim-fish'
Plug 'rust-lang/rust.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-liquid'

" Languages not often used (eg. Advent of code), enable if really needed
" Plug 'evanleck/vim-svelte'
" Plug 'wlangstroth/vim-racket'
" Plug 'derekwyatt/vim-scala'
" Plug 'elixir-editors/vim-elixir'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'algotech/ultisnips-php'

"Autocomplete/Language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Surround code with quotes, brackets, etc
Plug 'tpope/vim-surround'

"Git Plugin
Plug 'tpope/vim-fugitive'

" Show Git commits
Plug 'junegunn/gv.vim'

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

" Automatically regenerate .spl files from word lists
Plug 'micarmst/vim-spellsync'

" Atom-Like theme
Plug 'joshdick/onedark.vim'

" Move Lines with Shift-<Up> and Shift-<Down>
Plug 'vim-scripts/upAndDown'

" Quickly move between words in a line with f and t, highlights the unique
" find targets
Plug 'unblevable/quick-scope'

" Show filesystem tree in window
Plug 'scrooloose/nerdtree'

" Align text, see http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
Plug 'godlygeek/tabular'

" Automatically insert matching pairs for braces and quotes
Plug 'jiangmiao/auto-pairs'

" Automatically close tags
Plug 'alvan/vim-closetag'

" Notational Velocity
Plug 'alok/notational-fzf-vim'

" Asynchronous linting
Plug 'dense-analysis/ale'

call plug#end()	

colorscheme onedark

" Disable automated folding of markdown files
let g:vim_markdown_folding_disabled = 1


let g:ale_linters = {
	\'javascript':['eslint'],
	\'jsx':['eslint']
\}

runtime autoclose_tags.vim
runtime coc_config.vim
runtime wikiconfig.vim

" Re-enable for Scala file types
" au BufRead,BufNewFile *.sbt set filetype=scala

" Highlight *.pcss files (postcss) as CSS (will use the postcss syntax)
au BufNewFile,BufRead *.less set filetype=css

