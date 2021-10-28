-- Use true color Terminal
vim.opt.termguicolors=true

-- Set Tab width to 4 Spaces
vim.opt.tabstop=4

-- Set shiftwidth to 4
vim.opt.shiftwidth=4

-- Display line numbers in gutter
vim.opt.number=true

-- Highlight current line
vim.opt.cursorline=true

-- Proper word wrapping in soft wrap mode
vim.opt.linebreak=true

-- Set spelling dictionary
vim.opt.spellfile="~/.config/nvim/spell/en.utf-8.add"

-- Store undo tree between sessions. Nvim stores the files in /.local/share/nvim/undo (`:help undodir´)
vim.opt.undofile=true

-- Allow project-specific .vimrc files, but restrict commands to secure ones
vim.opt.exrc=true
vim.opt.secure=true

-- Faster updates of gitgutter and coc
vim.opt.updatetime=200

-- Turn on filetype plugins in .config/nvim/ftplugin
vim.cmd('filetype plugin on')

-- Limit spell suggestions to 15 items
-- Remove this when we switch spell to an FZF interface
-- (see https://coreyja.com/vim-spelling-suggestions-fzf/ )
vim.opt.spellsuggest = vim.opt.spellsuggest + '15'
