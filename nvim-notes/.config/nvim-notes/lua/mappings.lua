local keymap = vim.api.nvim_set_keymap
local o_noremap = { noremap = true }
local o_default = {}
local wk = require("which-key")

-- Upward motion line-by-line, even on wrapped lines
keymap("n", "<down>", "gj", o_noremap)
keymap("n", "<up>", "gk", o_noremap)
keymap("i", "<down>", "<C-o>gj", o_noremap)
keymap("i", "<up>", "<C-o>gk", o_noremap)

-- Use Tab as a buffer switcher in normal mode
keymap("n", "<Tab>", ":bnext<CR>", o_noremap)
keymap("n", "<S-Tab>", ":bprevious<CR>", o_noremap)

-- Delete search highlight with backspace
keymap("n", "<BS>", ":nohlsearch<CR>", o_noremap)

-- Switch between splits more quickly
keymap("n", "<C-J>", "<C-W><C-J>", o_noremap)
keymap("n", "<C-K>", "<C-W><C-K>", o_noremap)
keymap("n", "<C-L>", "<C-W><C-L>", o_noremap)
keymap("n", "<C-H>", "<C-W><C-H>", o_noremap)

wk.add({
	{ "<leader>,", '"sdl"sp', desc = "Swap two characters", remap = true },
	{
		"<leader>b",
		"<cmd>lua require('telescope.builtin').buffers({sort_mru=true,ignore_current_buffer=true})<CR>",
		desc = "Buffers",
		group = "Telescope",
	},
	{ "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<CR>", desc = "Find files", group = "Telescope" },
	{
		"<leader>gc",
		function()
			vim.api.nvim_feedkeys(":Git commit ", "n", false)
		end,
		desc = "Git commit (prompt)",
		group = "Git",
	},
	{ "<leader>gf", "<cmd>lua require('telescope.builtin').git_files()<CR>", desc = "Git files", group = "Telescope" },
	{ "<leader>gr", "<cmd>lua require('telescope.builtin').live_grep()<CR>", desc = "Grep", group = "Telescope" },
	{ "<leader>gs", ":Git<CR>", desc = "Git status", group = "Git" },
	{ "<leader>h", "<cmd>lua require('telescope.builtin').help_tags()<CR>", desc = "Help", group = "Telescope" },
	-- With the "marksman" LSP markdown headlines show up as string symbols
	-- TODO: Configure Hide "string" column and make the "symbol" as big as possible
	{
		"<leader>mh",
		"<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>",
		desc = "Show Headlines",
		group = "Telescope",
	},
	{ "<leader>ne", ":NvimTreeToggle<CR>", desc = "Toggle file tree" },

	-- ---------------------- Telekasten ---------------------
	-- Launch panel if nothing is typed after <leader>z
	{ "<leader>n", "<cmd>Telekasten panel<CR>", desc = "Telekasten Command Palette" },

	-- Most used functions
	{ "<leader>nf", "<cmd>Telekasten find_notes<CR>", desc = "Find notes", group = "Notes" },
	{ "<leader>ng", "<cmd>Telekasten search_notes<CR>", desc = "Search notes", group = "Notes" },
	{ "<leader>nd", "<cmd>Telekasten goto_today<CR>", desc = "Open today's note", group = "Notes" },
	{ "<leader>nz", "<cmd>Telekasten follow_link<CR>", desc = "Follow Link", group = "Notes" },
	{ "<leader>nn", "<cmd>Telekasten new_note<CR>", desc = "New Note", group = "Notes" },
	{ "<leader>nc", "<cmd>Telekasten show_calendar<CR>", desc = "Show Calendar", group = "Notes" },
	{ "<leader>nb", "<cmd>Telekasten show_backlinks<CR>", desc = "Show Backlinks", group = "Notes" },
	{ "<leader>nI", "<cmd>Telekasten insert_img_link<CR>", desc = "Insert image link", group = "Notes" },

	-- Call insert link automatically when we start typing a link
	{ "[[", "<cmd>Telekasten insert_link<CR>", mode = "i" },

	--- ------------------------- Spelling
	{ "z=", "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", desc = "Spell suggest" },
	{ "<leader>slg", "<cmd>set spell spellang=de<CR>", desc = "Set spelling language to German" },
	{ "<leader>sle", "<cmd>set spell spellang=en<CR>", desc = "Set spelling language to English" },
	{ "<leader>slm", "<cmd>set spell spellang=en,de<CR>", desc = "Set spelling language to English and German" },
})
