local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

-- Languages support (only plugins that do more than treesitter/language server)
Plug 'pearofducks/ansible-vim'
Plug 'andrewstuart/vim-kubernetes'
Plug 'towolf/vim-helm'
Plug 'vito-c/jq.vim'
Plug 'plasticboy/vim-markdown'
Plug 'alexlafroscia/postcss-syntax.vim'
Plug 'matthew-brett/vim-rst-sections'

-- Lua utility library for Telescope and null-ls
Plug 'nvim-lua/plenary.nvim'

-- Language Server
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jay-babu/mason-null-ls.nvim'
Plug('hrsh7th/cmp-nvim-lsp', {branch="main"})
Plug('hrsh7th/cmp-buffer', {branch="main"})
Plug('hrsh7th/nvim-cmp', {branch="main"})

-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', {['do']=':TSUpdate'})

-- Treesitter text motions
Plug 'nvim-treesitter/nvim-treesitter-textobjects';

-- Automatically close tags with Treesitter
Plug('windwp/nvim-ts-autotag')

-- Telescope as Fuzzy finder
Plug('nvim-telescope/telescope.nvim', {tag='0.1.2'})

-- Replace Vim selection menus with Telescope
Plug 'nvim-telescope/telescope-ui-select.nvim'

-- Automatically format code on saving
Plug 'sbdchd/neoformat'

-- Expand Zen coding / Emmet style class names to HTML with Ctrl-E
Plug 'rstacruz/sparkup'

-- Snippets
Plug('L3MON4D3/LuaSnip', { tag = 'v1.2.*'})
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'

-- Surround code with quotes, brackets, etc
Plug 'tpope/vim-surround'

-- Comment out blocks of code with gc
Plug 'tpope/vim-commentary'

-- Make plugin commands repeatable
Plug 'tpope/vim-repeat'

--Git Plugin
Plug 'tpope/vim-fugitive'

-- Case-aware search and replace with "Subvert"
-- Case-aware correction of frequently misspelt words with "Abolish"
-- Case toggle
Plug 'tpope/vim-abolish'

-- Obey .editorconfig files
Plug 'gpanders/editorconfig.nvim'

-- Improve status line
Plug 'vim-airline/vim-airline'

-- Move, Rename, Copy buffers and do other file system commands
Plug 'tpope/vim-eunuch'

-- Kill buffers without closing the current window
Plug 'famiu/bufdelete.nvim'

-- Wiki functionality
Plug 'lervag/wiki.vim'
--
-- Show contents of registers when hitting "
Plug 'junegunn/vim-peekaboo'

-- Make saving and loading sessions more comfortable
Plug 'rmagatti/auto-session'

-- TODO replace with https://github.com/lewis6991/gitsigns.nvim when I use a different plugin manager (to call setup)
-- Show Plus, minus and tilde signs in a gutter column to show git status--
Plug 'airblade/vim-gitgutter'

-- Automatically regenerate .spl files from word lists
Plug 'micarmst/vim-spellsync'

-- Run tests with keystrokes
Plug 'vim-test/vim-test'

-- Atom-Like theme
Plug 'navarasu/onedark.nvim'

-- Move Lines with Shift-<Up> and Shift-<Down>
Plug 'vim-scripts/upAndDown'

-- Quickly move between words in a line with f and t, highlights the unique
-- find targets
Plug 'unblevable/quick-scope'

-- Show filesystem tree in window (devicons needs a nerd font)
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

-- Automatically insert matching pairs for braces and quotes
Plug 'steelsojka/pears.nvim'

vim.call('plug#end')

