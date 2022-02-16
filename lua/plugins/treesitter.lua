require"nvim-treesitter.configs".setup {
  ensure_installed = "maintained",
  highlight = {enable = true},
  indent = {enable = true},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>]",
      node_incremental = "<CR>]",
      scope_incremental = "<CR>}",
      node_decremental = "<CR>["
    }
  }
}
