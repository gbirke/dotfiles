return {
	'williamboman/mason.nvim',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
	},
	config = function()
		local nvim_lsp = require("lspconfig")
		require("mason").setup()
		require("mason-lspconfig").setup {
			ensure_installed = { "dockerls", "volar", "tsserver", "intelephense", "pylsp" }
		}

		-- Setup handlers for LSP servers
		-- This is a table of lsp server names and handlers
		-- The default handler is called for servers not specified here
		-- The default handler is also used for servers that do not have a custom handler
		-- Custom handlers are called with the server name as the first argument
		-- see :h mason-lspconfig-automatic-server-setup for more details
		require("mason-lspconfig").setup_handlers {
			function (server_name) -- default handler, must be first in the list
				require("lspconfig")[server_name].setup {}
			end,

			-- Example of a custom handler
			-- ["dockerls"] = function (server_name)
			-- 	require("lspconfig")[server_name].setup {
			-- 		on_attach = function(client, bufnr)
			-- 			-- Disable formatting in dockerfiles
			-- 			if client.resolved_capabilities.document_formatting then
			-- 				vim.lsp.handlers["textDocument/formatting"] = function() end
			-- 			end
			-- 		end
			-- 	}
			-- end,
		}

		-- Set global, LSP-related keybindings
		local opts = { noremap=true, silent=true }
		vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
		vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		local on_attach = function(client, bufnr)

		  -- Mappings.
		  -- See `:help vim.lsp.*` for documentation on any of the below functions
		  local bufopts = { noremap=true, silent=true, buffer=bufnr }
		  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
		  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
		  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
		  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
		  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
		  vim.keymap.set('n', '<leader>s', vim.lsp.buf.signature_help, bufopts)
		  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
		  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
		  vim.keymap.set('n', '<leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		  end, bufopts)
		  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
		  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
		  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
		  vim.keymap.set('n', '<leader>p', function() vim.lsp.buf.format { async = true } end, bufopts)
		end
	end,

}
