local var = vim.api.nvim_set_var
-- local bvar = vim.api.nvim_buf_set_var
-- local wvar = vim.api.nvim_win_set_var
local opt = vim.api.nvim_set_option
local bopt = vim.api.nvim_buf_set_option
local wopt = vim.api.nvim_win_set_option

-- vim.cmd "colorscheme gruvbox"
vim.cmd("colorscheme nightfox")

var("netrw_liststyle", 3)
var("netrw_winsize", 30)
var("mapleader", " ")
opt("termguicolors", true)
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

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- disable builtins plugins
local disabled_built_ins = {
  "gzip", "zip", "zipPlugin", "tar", "tarPlugin", "getscript",
  "getscriptPlugin", "vimball", "vimballPlugin", "2html_plugin", "logipat",
  "rrhelper", "spellfile_plugin", "matchit"
}

for _, plugin in pairs(disabled_built_ins) do var("loaded_" .. plugin, 1) end
