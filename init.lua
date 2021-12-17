require("plugins")
require("lua.vars")
require("lua.keymaps")

vim.cmd "colorscheme gruvbox"
vim.api.nvim_set_var("airline_theme", "angr")
vim.api.nvim_set_var("airline_powerline_fonts", 1)
-- vim.api.nvim_set_var('airline#extensions#tabline#enabled', 1)
-- vim.api.nvim_set_var('airline#extensions#tabline#formatter', 'unique_tail')

-- netrw file explorer
vim.api.nvim_set_var("netrw_liststyle", 3)
vim.api.nvim_set_var("netrw_winsize", 30)

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
