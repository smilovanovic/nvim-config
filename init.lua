require("plugins")

vim.g.mapleader = " "
vim.go.ignorecase = true
vim.go.smartcase = true
vim.go.splitright = true
vim.go.splitbelow = true
vim.go.completeopt = "menu,menuone,noselect"

vim.o.clipboard = "unnamed,unnamedplus"

vim.bo.expandtab = true
-- vim.bo.tabstop = 2
-- vim.bo.softtabstop = 2
-- vim.bo.shiftwidth = 2
vim.bo.smartindent = true

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.colorcolumn = "100"
vim.wo.wrap = false

vim.cmd "colorscheme gruvbox"
vim.api.nvim_set_var("airline_theme", "angr")
vim.api.nvim_set_var("airline_powerline_fonts", 1)
-- vim.api.nvim_set_var('airline#extensions#tabline#enabled', 1)
-- vim.api.nvim_set_var('airline#extensions#tabline#formatter', 'unique_tail')

vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", {noremap = true, silent = true})

-- netrw file explorer
vim.api.nvim_set_var("netrw_liststyle", 3)
vim.api.nvim_set_var("netrw_winsize", 30)
vim.api.nvim_set_keymap("n", "<Leader>nh", ":h netrw-quickmap<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>nf", ":Lexplore %:p:h<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>nt", ":Lexplore<CR>", {noremap = true, silent = true})

-- vim.api.nvim_set_keymap('n', '<Leader>ff', 'g*', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<Leader>ff", ":Telescope find_files hidden=true<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap(
  "n",
  "<Leader>fF",
  ":Telescope find_files hidden=true no_ignore=true<cr>",
  {noremap = true, silent = true}
)
vim.api.nvim_set_keymap("n", "<Leader>fg", ":Telescope live_grep<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fb", ":Telescope buffers<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fh", ":Telescope help_tags<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fe", ":Telescope file_browser hidden=true<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fc", ":Telescope commands<cr>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<Leader>e", ":Telescope session-lens search_session<cr>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>se", ":SaveSession<cr>", {noremap = true, silent = true})

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

require("lsp")

require "nvim-treesitter.configs".setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

require("Comment").setup()
require("formatting")
require("vimspector")
