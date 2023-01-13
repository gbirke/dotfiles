-- Set colorscheme if loaded
vim.cmd('silent! colorscheme edge')

-- Highlight typescript sections
vim.g.vim_vue_plugin_use_typescript = 1


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

-- vim-vue syntax highlight and indent plugin
-- See https://github.com/leafOfTree/vim-vue-plugin#configuration
vim.g.vim_vue_plugin_config = { 
  syntax = {
	 template = { 'html' },
	 script = { 'javascript', 'typescript' },
	 style = { 'css', 'scss' },
  },
  full_syntax = {},
  initial_indent = {},
  attribute = 1,
  keyword = 0,
  foldexpr = 0,
  debug = 0
}

-- configure lervag/wiki
vim.g.wiki_link_target_type = 'md'
vim.g.wiki_filetypes = {'md', 'wiki'}


