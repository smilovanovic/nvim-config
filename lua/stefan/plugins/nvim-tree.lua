return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<Leader>nh", ":h nvim-tree-default-mappings<CR>" },
		{ "<Leader>nc", ":NvimTreeClose<CR>" },
		{ "<Leader>nf", ":NvimTreeFindFile<CR>" },
		{ "<Leader>nt", ":NvimTreeToggle<CR>" },
		{ "<Leader>no", ":NvimTreeFocus<CR>" },
	},
	config = function()
		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- change color for arrows in tree to light blue
		vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])
		require("nvim-tree").setup({
			-- change folder arrow icons
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			view = {
				adaptive_size = true,
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			git = {
				ignore = false,
			},
		})
	end,
}
