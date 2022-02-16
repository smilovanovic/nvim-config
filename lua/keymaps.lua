local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- prevent cut on delete and change
map("n", "D", "\"_D", default_opts)
map("n", "d", "\"_d", default_opts)
map("v", "d", "\"_d", default_opts)
map("n", "C", "\"_C", default_opts)
map("n", "c", "\"_c", default_opts)
map("v", "c", "\"_c", default_opts)

map("i", "<S-Tab>", "<C-d>", default_opts)

-- move lines up and down when highlighted
map("v", "J", ":m '>+1<CR>gv=gv", default_opts)
map("v", "K", ":m '<-2<CR>gv=gv", default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h", default_opts)
map("n", "<C-j>", "<C-w>j", default_opts)
map("n", "<C-k>", "<C-w>k", default_opts)
map("n", "<C-l>", "<C-w>l", default_opts)

-- search word under cursor
map("n", "<Leader>fw", "g*", default_opts)

-- netrw file explorer
map("n", "<Leader>nh", ":h netrw-quickmap<CR>", default_opts)
map("n", "<Leader>nf", ":Lexplore %:p:h<CR>", default_opts)
map("n", "<Leader>nt", ":Lexplore<CR>", default_opts)

-- Telescope bindings
map("n", "<Leader>ff", ":Telescope find_files hidden=true<cr>", default_opts)
map("n", "<Leader>fF", ":Telescope find_files hidden=true no_ignore=true<cr>",
    default_opts)
map("n", "<Leader>fg", ":Telescope live_grep<cr>", default_opts)
map("n", "<Leader>fb", ":Telescope buffers<cr>", default_opts)
map("n", "<Leader>fh", ":Telescope help_tags<cr>", default_opts)
map("n", "<Leader>fe", ":Telescope file_browser hidden=true<cr>", default_opts)
map("n", "<Leader>fc", ":Telescope commands<cr>", default_opts)
map("n", "<Leader>e", ":Telescope session-lens search_session<cr>", default_opts)
map("n", "<Leader>se", ":SaveSession<cr>", default_opts)
map("n", "<Leader>fs", ":Telescope current_buffer_fuzzy_find<cr>", default_opts)

map("n", "<C-f>", "<cmd>:Neoformat<CR>", default_opts)

-- yank file name, relative path, full path and directory
map("n", "<Leader>yfn", ":let @*=expand('%:t')<CR>", default_opts)
map("n", "<Leader>yfr", ":let @*=expand('%')<CR>", default_opts)
map("n", "<Leader>yfp", ":let @*=expand('%:p')<CR>", default_opts)
map("n", "<Leader>yfd", ":let @*=expand('%:p:h')<CR>", default_opts)

map("n", "<Leader>[", "::diffget //2<CR>", default_opts)
map("n", "<Leader>]", "::diffget //3<CR>", default_opts)
