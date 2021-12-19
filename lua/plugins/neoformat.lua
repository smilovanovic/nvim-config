local var = vim.api.nvim_set_var

var("neoformat_basic_format_align", 1)
var("neoformat_basic_format_retab", 1)
var("neoformat_basic_format_trim", 1)
-- var("neoformat_verbose", 1)
var("neoformat_lua_luaformatter", {
  exe = "lua-format",
  args = {
    '--indent-width=2', '--tab-width=2', '--continuation-indent-width=2',
    '--single-quote-to-double-quote'
  }
})
var("neoformat_enabled_lua", {"luaformatter"})

vim.cmd([[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]])

-- Override indentation
vim.cmd [[
  augroup IndentationOverridea
    autocmd!
    autocmd Filetype * setlocal ts=2 sts=2 sw=2
  augroup end
]]
