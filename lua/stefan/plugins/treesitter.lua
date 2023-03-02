return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	opts = {
		-- enable syntax highlighting
		highlight = {
			enable = true,
		},
		-- enable indentation
		indent = { enable = true },
		-- enable autotagging (w/ nvim-ts-autotag plugin)
		autotag = { enable = true },
		-- ensure these language parsers are installed
		ensure_installed = "all",
		-- auto install above language parsers
		auto_install = true,
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
	dependencies = {
		"windwp/nvim-ts-autotag",
		{
			"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
			opts = {
				check_ts = true, -- enable treesitter
				-- ts_config = {
				-- 	lua = { "string" }, -- don't add pairs in lua string treesitter nodes
				-- 	javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
				-- 	java = false, -- don't check treesitter on java
				-- },
			},
		},
	},
}
