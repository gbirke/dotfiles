require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
		-- opts could go here
      }
      
    }
  }
}

require("telescope").load_extension("ui-select")
