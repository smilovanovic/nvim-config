-- Override indentation
vim.cmd [[
  augroup IndentationOverridea
    autocmd!
    autocmd Filetype * setlocal ts=2 sts=2 sw=2
  augroup end
]]

vim.api.nvim_buf_set_keymap(0, "n", "<Leader>f", "<cmd>:Format<CR>", {noremap = true, silent = true})

local prettier = function()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
    stdin = true
  }
end

require("formatter").setup(
  {
    filetype = {
      javascript = {
        prettier
      },
      typescript = {
        prettier
      },
      json = {
        prettier
      },
      lua = {
        -- luafmt
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
    }
  }
)
