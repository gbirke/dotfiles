require("options")
require("plugins")
require("configure_plugins")
require("mappings")
vim.cmd 'source ~/.config/nvim/commands.vim'

-- Optional and machine-specific settings
vim.cmd [[
runtime autoclose_tags.vim
runtime wikiconfig.vim
]]

