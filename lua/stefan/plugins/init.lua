return {
	"nvim-lua/plenary.nvim",

	-- essential plugins
	"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)

	-- commenting with gc
	"numToStr/Comment.nvim",
	-- -- vs-code like icons
	"nvim-tree/nvim-web-devicons",
	-- -- statusline
	"nvim-lualine/lualine.nvim",
	-- configuring lsp servers
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	dependencies = {
	-- 		"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	-- 		"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
	-- 		"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	-- 		-- -- autocompletion
	-- 		{
	-- 			"hrsh7th/nvim-cmp", -- completion plugin
	-- 			dependencies = {
	-- 				"hrsh7th/cmp-buffer", -- source for text in buffer
	-- 				"hrsh7th/cmp-path", -- source for file system paths
	-- 				"hrsh7th/cmp-cmdline", -- source for vim's cmdline
	-- 				"hrsh7th/cmp-nvim-lua", -- source for vim's api
	-- 				"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	-- 				"onsails/lspkind.nvim", -- vs-code like icons for autocompletion
	-- 				"L3MON4D3/LuaSnip", -- snippet engine
	-- 				"saadparwaiz1/cmp_luasnip", -- for autocompletion
	-- 				"rafamadriz/friendly-snippets", -- useful snippets
	-- 			},
	-- 		},
	-- 	},
	-- }, -- easily configure language servers
	--
	-- formatting & linting
	--
	-- -- git integration
	"tpope/vim-fugitive", -- all git commans in nvim using :G
}
