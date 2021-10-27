vim.cmd('colorscheme onedark')

-- Start auto-pair plugin
require "pears".setup()


-- Highlight typescript sections
vim.g.vim_vue_plugin_use_typescript = 1


-- Specify CoC extensions that should always exist
vim.g.coc_global_extensions = {'coc-json', 'coc-rls'}


-- Disable automated folding of markdown files
vim.g.vim_markdown_folding_disabled = 1


-- ALE config
vim.g.ale_linters = {
	javascript = { 'eslint' },
	jsx = { 'eslint' },
	markdown = { 'mdl', 'writegood' }
}
vim.g.ale_php_phpcbf_standard='PSR12'
vim.g.ale_php_phpcs_standard='phpcs.xml.dist'
vim.g.ale_fixers = {
	 ['*'] = { 'remove_trailing_lines', 'trim_whitespace' },
	 php = { 'phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace' },
}


-- configure lervag/wiki
vim.g.wiki_link_target_type = 'md'
vim.g.wiki_filetypes = {'md', 'wiki'}


