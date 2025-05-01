return {
	"mfussenegger/nvim-lint",
	dependencies = {
		-- We already require mason in lsp.lua, but for completeness sake and easier installation of linters we require it here again
		"williamboman/mason.nvim",
	},
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			-- Prose linters, important for markup
			markdown = { "markdownlint", "vale" },
			gitcommit = { "gitlint", "vale" },

			-- These linters might highlight problems in embedded code blocks
			python = { "flake8" },
			javascript = { "eslint" },
			typescript = { "eslint" },
			dockerfile = { "hadolint" },
			lua = { "luacheck" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("linting", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Toggle linting in current buffer" })
	end,
}
