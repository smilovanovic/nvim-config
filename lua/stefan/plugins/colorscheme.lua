return {
	"ellisonleao/gruvbox.nvim",
lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		local gruvbox = require "gruvbox"
			gruvbox.setup({
				dim_inactive = true,
			})
			vim.cmd("colorscheme gruvbox")
	end,
}
