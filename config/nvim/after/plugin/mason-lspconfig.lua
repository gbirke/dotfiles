local nvim_lsp = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
	function (server_name)
		nvim_lsp[server_name].setup {}
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

