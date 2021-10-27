"{{{ Basic settings

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
"}}}

"{{{ Plugins
call plug#begin('~/.local/share/nvim/plugged')

" Languages support
Plug 'plasticboy/vim-markdown'
Plug 'pearofducks/ansible-vim'
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
Plug 'lepture/vim-jinja'
Plug 'jparise/vim-graphql'
Plug 'janiczek/vim-latte.git'

" Expand Zen coding / Emmet style class names to HTML with Ctrl-E
Plug 'rstacruz/sparkup'

"Autocomplete/Language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Surround code with quotes, brackets, etc
Plug 'tpope/vim-surround'

"Git Plugin
Plug 'tpope/vim-fugitive'

" Improve status line
Plug 'vim-airline/vim-airline'

" Move, Rename, Copy buffers and do other file system commands
Plug 'tpope/vim-eunuch'

" Kill buffers without closing the current window
Plug 'famiu/bufdelete.nvim'

" Wiki functionality
Plug 'lervag/wiki.vim'

" fzf integration
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Show contents of registers when hitting "
Plug 'junegunn/vim-peekaboo'

" Show Plus, minus and tilde signs in a gutter column to show git status"
Plug 'airblade/vim-gitgutter'

" Automatically regenerate .spl files from word lists
Plug 'micarmst/vim-spellsync'

" Run tests with keystrokes
Plug 'vim-test/vim-test'

" TODO Replace with https://github.com/monsonjeremy/onedark.nvim or
" https://github.com/navarasu/onedark.nvim when we have treesitter installed
" Atom-Like theme
Plug 'joshdick/onedark.vim'

" Move Lines with Shift-<Up> and Shift-<Down>
Plug 'vim-scripts/upAndDown'

" Quickly move between words in a line with f and t, highlights the unique
" find targets
Plug 'unblevable/quick-scope'

" TODO replace with https://github.com/kyazdani42/nvim-tree.lua
" Show filesystem tree in window
Plug 'scrooloose/nerdtree'

" Automatically insert matching pairs for braces and quotes
Plug 'steelsojka/pears.nvim'

" TODO replace with https://github.com/windwp/nvim-ts-autotag when we use
"      treesitter
" Automatically close tags
Plug 'alvan/vim-closetag'

" Asynchronous linting
Plug 'dense-analysis/ale'

call plug#end()

"}}}
"
"{{{ Keyboard mappings

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

command BD :Bdelete

" Upward motion line-by-line, even on wrapped lines
nnoremap <down> gj
nnoremap <up> gk

" Use Tab as a buffer switcher in normal mode
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

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
nmap <Leader>f :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>ne :NERDTreeToggle<CR>

" Show current file in NERDTree
nmap <Leader>nf :NERDTreeFind<CR>

" Run tests
nmap <Leader>tn :TestNearest<CR>
nmap <Leader>tf :TestFile<CR>
nmap <Leader>ts :TestSuite<CR>
nmap <Leader>tl :TestLast<CR>
nmap <Leader>tv :TestVisit<CR>

" Fugitive shortcuts
nmap <Leader>gs :Git<CR>
nmap <Leader>gc :Git commit

"}}}
"
"{{{ Plugin settings and color scheme

colorscheme onedark

" Start auto-pair plugin
lua require "pears".setup()

" Highlight typescript sections
let g:vim_vue_plugin_use_typescript = 1

" Language server for vue, needs https://www.npmjs.com/package/vue-language-server
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

" Specify CoC extensions that should always exist
let g:coc_global_extensions = ['coc-json', 'coc-rls']


" Disable automated folding of markdown files
let g:vim_markdown_folding_disabled = 1


let g:ale_linters = {
	\'javascript':['eslint'],
	\'jsx':['eslint'],
	\'markdown':['mdl', 'writegood']
\}
let g:ale_php_phpcbf_standard='PSR12'
let g:ale_php_phpcs_standard='phpcs.xml.dist'
let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
\}

let g:wiki_link_target_type = 'md'
let g:wiki_filetypes = ['md', 'wiki']

" }}}

" {{{ External configs
runtime autoclose_tags.vim
runtime coc_config.vim
runtime wikiconfig.vim
"}}}

" vim: set foldmethod=marker :
