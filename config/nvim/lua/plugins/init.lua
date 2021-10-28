local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- Languages support
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
Plug 'janiczek/vim-latte'

-- Language Server
Plug 'neovim/nvim-lspconfig'
Plug('williamboman/nvim-lsp-installer', {branch="main"})
Plug('hrsh7th/cmp-nvim-lsp', {branch="main"})
Plug('hrsh7th/cmp-buffer', {branch="main"})
Plug('hrsh7th/nvim-cmp', {branch="main"})

-- Expand Zen coding / Emmet style class names to HTML with Ctrl-E
Plug 'rstacruz/sparkup'

-- Snippets
Plug 'SirVer/ultisnips'
Plug 'algotech/ultisnips-php'
Plug('quangnguyen30192/cmp-nvim-ultisnips', {branch="main"}) -- Ultisnips as source for completion

-- Surround code with quotes, brackets, etc
Plug 'tpope/vim-surround'

-- Make plugin commands repeatable
Plug 'tpope/vim-repeat'

--Git Plugin
Plug 'tpope/vim-fugitive'

-- Improve status line
Plug 'vim-airline/vim-airline'

-- Move, Rename, Copy buffers and do other file system commands
Plug 'tpope/vim-eunuch'

-- Kill buffers without closing the current window
Plug 'famiu/bufdelete.nvim'

-- Wiki functionality
Plug 'lervag/wiki.vim'

-- fzf integration
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

-- Show contents of registers when hitting --
Plug 'junegunn/vim-peekaboo'

-- Show Plus, minus and tilde signs in a gutter column to show git status--
Plug 'airblade/vim-gitgutter'

-- Automatically regenerate .spl files from word lists
Plug 'micarmst/vim-spellsync'

-- Run tests with keystrokes
Plug 'vim-test/vim-test'

-- TODO Replace with https://github.com/monsonjeremy/onedark.nvim or
-- https://github.com/navarasu/onedark.nvim when we have treesitter installed
-- Atom-Like theme
Plug 'joshdick/onedark.vim'

-- Move Lines with Shift-<Up> and Shift-<Down>
Plug 'vim-scripts/upAndDown'

-- Quickly move between words in a line with f and t, highlights the unique
-- find targets
Plug 'unblevable/quick-scope'

-- Show filesystem tree in window
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

-- Automatically insert matching pairs for braces and quotes
Plug 'steelsojka/pears.nvim'

-- TODO replace with https://github.com/windwp/nvim-ts-autotag when we use
--      treesitter
-- Automatically close tags
Plug 'alvan/vim-closetag'

-- Asynchronous linting
Plug 'dense-analysis/ale'

vim.call('plug#end')

