local keymap = vim.api.nvim_set_keymap
local o_noremap = {noremap=true}
local o_default = {}
local wk = require("which-key")

-- Upward motion line-by-line, even on wrapped lines
keymap('n', '<down>', 'gj', o_noremap)
keymap('n', '<up>', 'gk', o_noremap)

-- Use Tab as a buffer switcher in normal mode
keymap('n', '<Tab>', ':bnext<CR>', o_noremap)
keymap('n', '<S-Tab>', ':bprevious<CR>', o_noremap)

-- Delete search highlight with backspace
keymap('n', '<BS>', ':nohlsearch<CR>', o_noremap)

-- Switch between splits more quickly
keymap('n', '<C-J>', '<C-W><C-J>', o_noremap)
keymap('n', '<C-K>', '<C-W><C-K>', o_noremap)
keymap('n', '<C-L>', '<C-W><C-L>', o_noremap)
keymap('n', '<C-H>', '<C-W><C-H>', o_noremap)

wk.add({
    { "<leader>,", '"sdl"sp', desc = "Swap two characters", remap = true },
    { "<leader>b", "<cmd>lua require('telescope.builtin').buffers({sort_mru=true})<CR>", desc = "Buffers", group="Telescope" },
    { "<leader>f", "<cmd>lua require('telescope.builtin').find_files()<CR>", desc = "Find files", group="Telescope" },
    { "<leader>gc", ":Git commit", desc = "Git commit", group="Git" },
    { "<leader>gf", "<cmd>lua require('telescope.builtin').git_files()<CR>", desc = "Git files", group="Telescope" },
    { "<leader>gr", "<cmd>lua require('telescope.builtin').live_grep()<CR>", desc = "Grep", group="Telescope" },
    { "<leader>gs", ":Git<CR>", desc = "Git status", group="Git" },
    { "<leader>h", "<cmd>lua require('telescope.builtin').help_tags()<CR>", desc = "Help", group="Telescope" },
    { "<leader>ne", ":NvimTreeToggle<CR>", desc = "Toggle file tree" },
    { "<leader>nf", ":NvimTreeFindFile<CR>", desc = "Show current file in tree" },
    { "<leader>tf", ":TestFile<CR>", desc = "Test file" },
    { "<leader>tl", ":TestLast<CR>", desc = "Test last" },
    { "<leader>tn", ":TestNearest<CR>", desc = "Test nearest" },
    { "<leader>ts", ":TestSuite<CR>", desc = "Test suite" },
    { "<leader>tv", ":TestVisit<CR>", desc = "Test visit" },
    { "z=", "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", desc = "Spell suggest" },

})
