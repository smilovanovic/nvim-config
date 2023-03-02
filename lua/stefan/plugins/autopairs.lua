return {
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	opts = {
		check_ts = true, -- enable treesitter
		-- ts_config = {
		-- 	lua = { "string" }, -- don't add pairs in lua string treesitter nodes
		-- 	javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
		-- 	java = false, -- don't check treesitter on java
		-- },
	},
}
