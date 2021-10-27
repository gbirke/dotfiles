require("options")
require("plugins")
require("mappings")
require("plugin_settings")
vim.cmd 'source ~/.config/nvim/commands.vim'

-- Optional and machine-specific settings
vim.cmd [[
runtime autoclose_tags.vim
runtime wikiconfig.vim
]]

