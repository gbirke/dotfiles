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
			python = { "flake8" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			dockerfile = { "hadolint" },
			lua = { "luacheck" },
			go = { "golangcilint" },

			markdown = { "markdownlint", "vale" },
			gitcommit = { "gitlint", "vale" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("linting", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ll", function()
			if vim.diagnostic.is_enabled() then
				vim.diagnostic.disable()
			else
				vim.diagnostic.enable()
				lint.try_lint()
			end
		end, { desc = "Toggle linting in current buffer" })
	end,
}
