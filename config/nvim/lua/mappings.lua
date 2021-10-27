vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local o_noremap = {noremap=true}
local o_default = {}

-- Upward motion line-by-line, even on wrapped lines
keymap('n', '<down>', 'gj', o_noremap)
keymap('n', '<up>', 'gk', o_noremap)

-- Use Tab as a buffer switcher in normal mode
keymap('n', '<Tab>', ':bnext<CR>', o_noremap)
keymap('n', '<S-Tab>', ':bprevious<CR>', o_noremap)

-- Delete search highlight with backspace
keymap('n', '<BS>', ':nohlsearch<CR>', o_noremap)

-- Switch between splits more quickly
keymap('n', '<C-J>', '<C-W><C-J>', o_noremap)
keymap('n', '<C-K>', '<C-W><C-K>', o_noremap)
keymap('n', '<C-L>', '<C-W><C-L>', o_noremap)
keymap('n', '<C-H>', '<C-W><C-H>', o_noremap)

-- Swap two characters (Cursor on the first char)
keymap('n', '<Leader>,', '"sdl"sp', o_default)

keymap('n', '<Leader>b', ':Buffers<CR>', o_default)
keymap('n', '<Leader>f', ':Files<CR>', o_default)
keymap('n', '<Leader>r', ':Tags<CR>', o_default)
keymap('n', '<Leader>ne', ':NERDTreeToggle<CR>', o_default)

-- Show current file in NERDTree
keymap('n', '<Leader>nf', ':NERDTreeFind<CR>', o_default)

-- Run tests
keymap('n', '<Leader>tn', ':TestNearest<CR>', o_default)
keymap('n', '<Leader>tf', ':TestFile<CR>', o_default)
keymap('n', '<Leader>ts', ':TestSuite<CR>', o_default)
keymap('n', '<Leader>tl', ':TestLast<CR>', o_default)
keymap('n', '<Leader>tv', ':TestVisit<CR>', o_default)

-- Fugitive shortcuts
keymap('n', '<Leader>gs', ':Git<CR>', o_default)
keymap('n', '<Leader>gc', ':Git commit', o_default)

