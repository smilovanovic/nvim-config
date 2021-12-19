return function()
  -- require("session-lens").setup({previewer = false})
  require("session-lens").setup {
    path_display = {"shorten"},
    theme_conf = {border = false},
    previewer = true
  }
end
