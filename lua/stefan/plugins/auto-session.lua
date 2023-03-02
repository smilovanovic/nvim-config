return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			auto_session_create_enabled = false,
			post_restore_cmds = {
				function()
					vim.cmd("silent! bd NvimTree_1")
				end,
			},
		})
	end,
}
