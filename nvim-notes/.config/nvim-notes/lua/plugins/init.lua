return {
	-- Surround code with quotes, brackets, etc
	"tpope/vim-surround",

	-- Make plugin commands repeatable
	"tpope/vim-repeat",

	--Git Plugin
	"tpope/vim-fugitive",

	-- Case-aware search and replace with "Subvert"
	-- Case-aware correction of frequently misspelt words with "Abolish"
	-- Case toggle
	"tpope/vim-abolish",

	-- Improve status line
	"vim-airline/vim-airline",

	-- Move, Rename, Copy buffers and do other file system commands
	"tpope/vim-eunuch",

	-- Kill buffers without closing the current window
	"famiu/bufdelete.nvim",

	-- Jump to last edit position when opening a file
	"farmergreg/vim-lastplace",

	-- Show Plus, minus and tilde signs in a gutter column to show git status--
	{
		"lewis6991/gitsigns.nvim",
		config = true, -- call the setup function without arguments
	},

	-- Automatically regenerate .spl files from word lists
	"micarmst/vim-spellsync",

	-- Move Lines with Shift-<Up> and Shift-<Down>
	"vim-scripts/upAndDown",

	-- Quickly move between words in a line with f and t, highlights the unique
	-- find targets
	"unblevable/quick-scope",

	-- Automatically insert matching pairs for braces and quotes
	{
		"steelsojka/pears.nvim",
		config = function()
			require("pears").setup(function(conf)
				-- For inserting brackets in markdown files on a laptp,
				-- where there is no dedicated delete key, only backspace
				conf.remove_pair_on_outer_backspace(false)
			end)
		end,
	},
}
