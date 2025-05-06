return {
	-- Telekasten uses Telescope to give Obsidian-like functionality
	{
		"renerocksai/telekasten.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("telekasten").setup({
				home = vim.fn.expand("~/Documents/fleeting-notes"),
				-- Avoid setting "telekasten" filetype, it conflicts with "render-markdown"
				auto_set_filetype = false,
				extension = ".md",
				-- dailies = "dailies",
				-- weeklies = "weeklies",
				-- templates = "templates",
				-- image_subdir = "images",
				-- template_new_note = "template.md",
				-- template_new_daily = "daily.md",
				-- template_new_weekly = "weekly.md",
				-- template_new_monthly = "monthly.md",
				-- template_new_yearly = "yearly.md",
			})
		end,
	},

	-- Preview markdown files in the browser
	-- install without yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- Nicer list editing
	{ "bullets-vim/bullets.vim" },

	-- Automatically save files, for a smoother experience
	{
		"okuuva/auto-save.nvim",
		version = "^1.0.0",
		cmd = "ASToggle",
		-- Load plugin and start autosaving on these events (Otherwise I'd have to toggle autosave manually)
		event = { "InsertLeave", "TextChanged" },
		-- You must pass opts, otherwise loading with Lazy will fail
		opts = {},
	},

	-- render markdown headers and lists more beautifully
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			file_types = { "markdown", "quarto", "telekasten" },
		},
	},
}
