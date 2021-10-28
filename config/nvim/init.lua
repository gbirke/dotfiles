require("options")
require("plugins")
require("plugin_settings")
require("mappings")
vim.cmd 'source ~/.config/nvim/commands.vim'

-- Optional and machine-specific settings
vim.cmd [[
runtime autoclose_tags.vim
runtime wikiconfig.vim
]]

