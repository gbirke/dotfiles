-- Set up null-ls (providing the LSP interface for linter and formatter plugins)
require("mason-null-ls").setup({
	ensure_installed = { "write-good" },
    automatic_setup = true,
})
