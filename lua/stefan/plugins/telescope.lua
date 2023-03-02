return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
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
}
