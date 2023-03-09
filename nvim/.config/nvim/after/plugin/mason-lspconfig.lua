local nvim_lsp = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = { "dockerls", "volar", "tsserver", "intelephense", "pylsp" }
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
  vim.keymap.set('n', '<C-K>', vim.lsp.buf.signature_help, bufopts)
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


require("mason-lspconfig").setup_handlers {
	function (server_name)
		nvim_lsp[server_name].setup {
		  on_attach = on_attach,
		}
	end,
	-- make lsp distinguish between deno TS and node TS
	["denols"] = function()
		nvim_lsp.denols.setup {
		  on_attach = on_attach,
		  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
		}
	end,
	["tsserver"] = function()
		nvim_lsp.tsserver.setup {
		  on_attach = on_attach,
		  root_dir = nvim_lsp.util.root_pattern("package.json"),
		}
	end
}

