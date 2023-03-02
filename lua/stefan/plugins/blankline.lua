return {
	"lukas-reineke/indent-blankline.nvim",
	{
		"echasnovski/mini.indentscope",
		version = "*",
		config = function()
			require("mini.indentscope").setup({
				draw = {
					animation = require("mini.indentscope").gen_animation.none(),
				},
				symbol = "",
			})
		end,
	},
}
