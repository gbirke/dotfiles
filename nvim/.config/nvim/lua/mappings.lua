local keymap = vim.api.nvim_set_keymap
local o_noremap = {noremap=true}
local o_default = {}
local wk = require("which-key")

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

keymap('n', '<Leader>hw', ":echo 'Hello, world!'<CR>", o_noremap)

wk.register({
	["<leader>"] = {
		[','] = {
			'"sdl"sp',
			"Swap two characters",
			noremap = false
		},

		b = {
			"<cmd>lua require('telescope.builtin').buffers({sort_lastused=true})<CR>",
			"Buffers"
		},
		f = {
			"<cmd>lua require('telescope.builtin').find_files()<CR>",
			"Find files"
		},
		gf = {
			"<cmd>lua require('telescope.builtin').git_files()<CR>",
			"Git files"
		},
		gr = {
			"<cmd>lua require('telescope.builtin').live_grep()<CR>",
			"Grep"
		},
		h = {
			"<cmd>lua require('telescope.builtin').help_tags()<CR>",
			"Help"
		},
		

		ne = {
			':NvimTreeToggle<CR>',
			"Toggle file tree"
		},
		nf = {
			':NvimTreeFindFile<CR>',
			"Show current file in tree"
		},

		-- Test shortcuts
		tn = {
			':TestNearest<CR>',
			"Test nearest"
		},
		tf = {
			':TestFile<CR>',
			"Test file"
		},
		ts = {
			':TestSuite<CR>',
			"Test suite"
		},
		tl = {
			':TestLast<CR>',
			"Test last"
		},
		tv = {
			':TestVisit<CR>',
			"Test visit"
		},


		-- Fugitive shortcuts
		gs = {
			':Git<CR>',
			"Git status"
		},
		gc = {
			':Git commit<CR>',
			"Git commit"
		},

	}, -- END leader
	["z="] = {
			"<cmd>lua require('telescope.builtin').spell_suggest()<CR>",
			"Spell suggest"
	},
})

