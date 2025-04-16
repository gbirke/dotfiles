-- Show list of config files in Telescope dialog
vim.api.nvim_create_user_command("Config", function()
	require("telescope.builtin").find_files({ cwd = "~/.config/nvim-notes" })
end, {})
