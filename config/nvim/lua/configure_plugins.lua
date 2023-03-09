-- Set colorscheme if loaded
vim.cmd('silent! colorscheme edge')

-- Disable automated folding of markdown files
vim.g.vim_markdown_folding_disabled = 1

-- Highlight typescript sections
vim.g.vim_vue_plugin_use_typescript = 1

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


