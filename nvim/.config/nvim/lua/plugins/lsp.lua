return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{
			'williamboman/mason.nvim',
			dependencies = {
				'williamboman/mason-lspconfig.nvim',
			},
			config = function()
				require("mason").setup()
				require("mason-lspconfig").setup {
					ensure_installed = { "dockerls", "volar", "ts_ls", "intelephense", "pylsp" }
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
			end,
			cond = function()
				if vim.fn.has('unix') == 0 then
					return true
				end
				local handle = io.popen("uname -a")
			    local result = handle:read("*a")
			    handle:close()
				
				-- TODO: Disable on NixOS when we have a list of NixOS-specific LSPs
				return true
			    -- return result:match("NixOS") == nil
			end

		} -- END Mason dependency
	},
	config = function()
		local nvim_lsp = require("lspconfig")

		-- Set global, LSP-related keybindings
		local opts = { noremap=true, silent=true }
		vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap = true, silent = true, desc = "LSP: Show [E]rrors" })
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
		vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
			callback = function(event)
			  -- NOTE: Remember that Lua is a real programming language, and as such it is possible
			  -- to define small helper and utility functions so you don't have to repeat yourself.
			  --
			  -- In this case, we create a function that lets us more easily define mappings specific
			  -- for LSP related items. It sets the mode, buffer and description for us each time.
			  local map = function(keys, func, desc, mode)
				mode = mode or 'n'
				vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
			  end

			  -- Jump to the definition of the word under your cursor.
			  --  This is where a variable was first declared, or where a function is defined, etc.
			  --  To jump back, press <C-t>.
			  map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

			  -- Find references for the word under your cursor.
			  map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

			  -- Jump to the implementation of the word under your cursor.
			  --  Useful when your language has ways of declaring types without an actual implementation.
			  map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

			  -- Jump to the type of the word under your cursor.
			  --  Useful when you're not sure what type a variable is and you want to see
			  --  the definition of its *type*, not where it was *defined*.
			  map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

			  -- Fuzzy find all the symbols in your current document.
			  --  Symbols are things like variables, functions, types, etc.
			  map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

			  -- Fuzzy find all the symbols in your current workspace.
			  --  Similar to document symbols, except searches over your entire project.
			  map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

			  -- Rename the variable under your cursor.
			  --  Most Language Servers support renaming across files, etc.
			  map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

			  -- Execute a code action, usually your cursor needs to be on top of an error
			  -- or a suggestion from your LSP for this to activate.
			  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

			  map('<leader>cf', function() vim.lsp.buf.format { async = true } end, '[C]ode [F]ormatting')

			  -- WARN: This is not Goto Definition, this is Goto Declaration.
			  --  For example, in C this would take you to the header.
			  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

			  -- The following two autocommands are used to highlight references of the
			  -- word under your cursor when your cursor rests there for a little while.
			  --    See `:help CursorHold` for information about when this is executed
			  --
			  -- When you move your cursor, the highlights will be cleared (the second autocommand).
			  local client = vim.lsp.get_client_by_id(event.data.client_id)
			  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
				local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
				vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
				  buffer = event.buf,
				  group = highlight_augroup,
				  callback = vim.lsp.buf.document_highlight,
				})

				vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
				  buffer = event.buf,
				  group = highlight_augroup,
				  callback = vim.lsp.buf.clear_references,
				})

				vim.api.nvim_create_autocmd('LspDetach', {
				  group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
				  callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
				  end,
				})
			  end

			  -- The following code creates a keymap to toggle inlay hints in your
			  -- code, if the language server you are using supports them
			  --
			  -- This may be unwanted, since they displace some of your code
			  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
				map('<leader>th', function()
				  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
				end, '[T]oggle Inlay [H]ints')
			  end
			end,
      })

	end,

}
