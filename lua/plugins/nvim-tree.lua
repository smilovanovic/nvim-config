require("nvim-tree").setup()

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map("n", "<Leader>nh", ":h nvim-tree-default-mappings<CR>", default_opts)
map("n", "<Leader>n-", ":NvimTreeCollapse<CR>", default_opts)
map("n", "<Leader>nc", ":NvimTreeClose<CR>", default_opts)
map("n", "<Leader>nr", ":NvimTreeRefresh<CR>", default_opts)
map("n", "<Leader>nf", ":NvimTreeFindFile<CR>", default_opts)
map("n", "<Leader>nt", ":NvimTreeToggle<CR>", default_opts)
map("n", "<Leader>no", ":NvimTreeFocus<CR>", default_opts)

