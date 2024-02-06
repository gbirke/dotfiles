return {
	-- Surround code with quotes, brackets, etc
	'tpope/vim-surround',

	-- Comment out blocks of code with gc
	'tpope/vim-commentary',

	-- Make plugin commands repeatable
	'tpope/vim-repeat',

	--Git Plugin
	'tpope/vim-fugitive',

	-- Case-aware search and replace with "Subvert"
	-- Case-aware correction of frequently misspelt words with "Abolish"
	-- Case toggle
	'tpope/vim-abolish',

	-- Improve status line
	'vim-airline/vim-airline',

	-- Move, Rename, Copy buffers and do other file system commands
	'tpope/vim-eunuch',

	-- Kill buffers without closing the current window
	'famiu/bufdelete.nvim',

	-- Show contents of registers when hitting "
	-- TODO: replace with which-key, which does more
	'junegunn/vim-peekaboo',

	-- Make saving and loading sessions more comfortable
	{
		'rmagatti/auto-session',
		config = function()
			require('auto-session').setup()
		end
	},

	-- Jump to last edit position when opening a file
	'farmergreg/vim-lastplace',

	-- Show Plus, minus and tilde signs in a gutter column to show git status--
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	},

	-- Automatically regenerate .spl files from word lists
	'micarmst/vim-spellsync',

	-- Run tests with keystrokes
	'vim-test/vim-test',

	-- Move Lines with Shift-<Up> and Shift-<Down>
	'vim-scripts/upAndDown',

	-- Quickly move between words in a line with f and t, highlights the unique
	-- find targets
	'unblevable/quick-scope',

	-- Github Copilot
	-- In the future I might use nvim-cmp-copilot instead,
	-- so I don't have to mess with the tab settings.
	-- Currently (2023-09-05) there are too many reports of problems floating around
	'github/copilot.vim',

	-- Automatically insert matching pairs for braces and quotes
	{
		'steelsojka/pears.nvim',
		config = function()
			require "pears".setup( function(conf)
				-- For inserting brackets in markdown files on a laptp,
				-- where there is no dedicated delete key, only backspace
				conf.remove_pair_on_outer_backspace(false)
			end )
		end
	}
}
