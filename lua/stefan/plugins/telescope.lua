return {
	"nvim-telescope/telescope.nvim",
	build = "make",
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		"smilovanovic/telescope-search-dir-picker.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			-- configure custom mappings
			defaults = {
				layout_strategy = "vertical",
				layout_config = { mirror = true },
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("search_dir_picker")
	end,
	keys = {
		-- telescope
		{ "<leader>ff", ":Telescope git_files hidden=true<CR>" }, -- find files within current working directory, respects .gitignore
		-- { "<leader>ff", ":Telescope find_files hidden=true<CR>" }, -- find files within current working directory, respects .gitignore
		{ "<leader>fF", ":Telescope find_files hidden=true no_ignore=true<CR>" }, -- find files within current working directory, respects .gitignore
		-- remove search_dirs for non ts projects
		{ "<leader>fg", ":Telescope live_grep<CR>" }, -- find string in current working directory as you type
		{ "<leader>fG", ":Telescope search_dir_picker<CR>" }, -- live search in specific directory
		{ "<leader>fS", ":Telescope grep_string<CR>" }, -- find string under cursor in current working directory
		{ "<Leader>fs", ":Telescope current_buffer_fuzzy_find<CR>" }, -- find something in current buffer
		{ "<leader>fb", ":Telescope buffers<CR>" }, -- list open buffers in current neovim instance
		{ "<leader>fh", ":Telescope help_tags<CR>" }, -- list available help tags
		{ "<Leader>fc", ":Telescope commands<CR>" },
		{ "<Leader>qf", ":Telescope quickfix<CR>" },
		{ "<Leader>qh", ":Telescope quickfixhistory<CR>" },
		{ "<Leader>su", ":Telescope spell_suggest<CR>" },
		{ "<Leader>fm", ":Telescope marks<CR>" },
	},
}
