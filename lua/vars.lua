local var = vim.api.nvim_set_var
local bvar = vim.api.nvim_buf_set_var
local wvar = vim.api.nvim_win_set_var
local opt = vim.api.nvim_set_option
local bopt = vim.api.nvim_buf_set_option
local wopt = vim.api.nvim_win_set_option

var("mapleader", " ")
opt("ignorecase", true)
opt("smartcase", true)
opt("splitright", true)
opt("splitbelow", true)
opt("completeopt", "menu,menuone,noselect")
opt("clipboard", "unnamed,unnamedplus")
bopt(0, "expandtab", true)
bopt(0, "smartindent", true)
wopt(0, "number", true)
wopt(0, "relativenumber", true)
wopt(0, "colorcolumn", "100")
wopt(0, "wrap", false)
