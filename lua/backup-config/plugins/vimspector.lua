vim.api.nvim_set_keymap("n", "<Leader>di", "<Plug>VimspectorBalloonEval",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap("x", "<Leader>di", "<Plug>VimspectorBalloonEval",
                        {noremap = true, silent = true})
vim.g.vimspector_enable_mappings = "HUMAN"
vim.api.nvim_set_keymap("n", "<F2>", ":call vimspector#ListBreakpoints()<cr>",
                        {noremap = true, silent = true})

