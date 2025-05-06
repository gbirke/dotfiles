return {
	"nvim-telescope/telescope.nvim",
	version = "~0.1.4",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local telescopeConfig = require("telescope.config")
		local actions = require("telescope.actions")

		-- Clone the default Telescope configuration
		local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

		-- I want to search in hidden/dot files.
		table.insert(vimgrep_arguments, "--hidden")
		-- I don't want to search in the `.git` directory.
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		telescope.setup({
			defaults = {
				vimgrep_arguments = vimgrep_arguments,
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
				buffers = {
					sort_lastused = true,
					sort_mru = true,
					ignore_current_buffer = true,
					mappings = {
						i = {
							["<c-d>"] = actions.delete_buffer,
						},
						n = {
							["<c-d>"] = actions.delete_buffer,
						},
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- opts could go here
					}),
				},
			},
		})

		telescope.load_extension("ui-select")
	end,
}
