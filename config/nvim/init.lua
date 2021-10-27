require("options")
require("plugins")
-- Disable the following 3 files when bootstrapping, otherwise you will get Lua errors
-- TODO use packer instead of vim-plug (or "after/plugin" scripts) to load plugin-specific configuration
require("plugins/_lsp")
require("plugins/_lsp-cmp")
require("plugin_settings")
require("mappings")
vim.cmd 'source ~/.config/nvim/commands.vim'

-- Optional and machine-specific settings
vim.cmd [[
runtime autoclose_tags.vim
runtime wikiconfig.vim
]]

