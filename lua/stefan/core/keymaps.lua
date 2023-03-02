-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- increment/decrement numbers
-- keymap.set("n", "<leader>+", "<C-a>") -- increment
-- keymap.set("n", "<leader>-", "<C-x>") -- decrement

keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- close current buffer
keymap.set("n", "<C-q>", ":bd!<CR>")
-- close all but the current buffer
keymap.set("n", "<C-a>", ":%bdelete|edit#|bdelete#!<CR>")

-- prevent cut
keymap.set("n", "C", '"_C')
keymap.set("n", "c", '"_c')
keymap.set("v", "c", '"_c')
keymap.set("n", "<leader>d", '"_d')
keymap.set("n", "<leader>D", '"_D')
keymap.set("v", "<leader>d", '"_d')

keymap.set("i", "<S-Tab>", "<C-d>")

-- move lines up and down when highlighted
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- center screen after up and down jumps
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- center screen for search results
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- preserve clipboard after visual paste
keymap.set("x", "p", '"_dP')

-- move around splits using Ctrl + {h,j,k,l}
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- search word under cursor
keymap.set("n", "<Leader>fw", "g*")

-- yank file name, relative path, full path and directory
keymap.set("n", "<Leader>yfn", ":let @*=expand('%:t')<CR>")
keymap.set("n", "<Leader>yfr", ":let @*=expand('%:')<CR>")
keymap.set("n", "<Leader>yfp", ":let @*=expand('%:p')<CR>")
keymap.set("n", "<Leader>yfd", ":let @*=expand('%:p:h')<CR>")

-- take left [ or right ] while merging diffs
keymap.set("n", "<Leader>[", "::diffget //2<CR>")
keymap.set("n", "<Leader>]", "::diffget //3<CR>")

-- quickfix list
keymap.set("n", "<Leader>qo", ":copen<CR>")
keymap.set("n", "<Leader>qc", ":cclose<CR>")
keymap.set("n", "<Leader>qn", ":cn<CR>")
keymap.set("n", "<Leader>qp", ":cp<CR>")

----------------------
-- Plugin Keybinds
----------------------

-- Session management
keymap.set("n", "<Leader>e", ":Telescope session-lens search_session<CR>")
keymap.set("n", "<Leader>se", ":SaveSession<CR>")

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", ":Telescope git_commits<CR>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", ":Telescope git_bcommits<CR>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", ":Telescope git_status<CR>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
-- keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mappin to restart lsp if necessary
keymap.set("n", "<leader>rs", function()
	vim.cmd([[LspRestart]])
	vim.cmd([[!pkill eslint_d]])
	print("LSP Restarted")
end)
