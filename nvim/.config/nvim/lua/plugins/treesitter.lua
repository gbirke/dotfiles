return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		-- Treesitter text motions
		"nvim-treesitter/nvim-treesitter-textobjects",

		-- Automatically close tags with Treesitter
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all" (c,lua, vim, vimdoc and query parsers should always be installed)
			ensure_installed = {
				"diff",
				"gitcommit",
				"html",
				"php",
				"javascript",
				"typescript",
				"css",
				"python",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			-- List of parsers to ignore installing (for "all")
			-- ignore_install = { "javascript" },

			---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

			highlight = {
				-- `false` will disable the whole extension
				enable = true,

				-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
				-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
				-- the name of the parser)
				-- list of language that will be disabled
				-- disable = { "c", "rust" },
				-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},

			-- Enable nvim-ts-autotag plugin for automatically closing and renaming HTML tags
			autotag = {
				enable = true,
			},

			-- Text objects
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						-- You can optionally set descriptions to the mappings (used in the desc parameter of
						-- nvim_buf_set_keymap) which plugins like which-key display
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						-- You can also use captures from other query groups like `locals.scm`
						["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
					},
				},
			},
		})
	end,
}
