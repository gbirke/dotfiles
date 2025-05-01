return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- LuaSnip is its own file, so we don't list it here as dependency because it'll look weird in the Lazy dashboard
		-- 'L3MON4D3/LuaSnip',
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",

		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"zbirenbaum/copilot-cmp",
			event = "InsertEnter",
			config = function()
				require("copilot_cmp").setup()
			end,
			dependencies = {
				"zbirenbaum/copilot.lua",
				cmd = "Copilot",
				config = function()
					require("copilot").setup({
						suggestion = { enabled = false },
						panel = { enabled = false },
					})
				end,
			},
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				-- No tab completion, Tab is used for Github Copilot
			}),
			sources = cmp.config.sources({
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{
					name = "buffer",
					options = {
						get_bufnrs = function()
							return vim.api.nvim_list_bufs()
						end,
					},
				},
				{ name = "path" },
			}),
		})
	end,
}
