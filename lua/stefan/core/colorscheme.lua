-- set colorscheme with protected call
-- in case it isn't installed

local gb_status, gruvbox = pcall(require, "gruvbox")
if gb_status then
	gruvbox.setup({
		dim_inactive = true,
	})
	vim.cmd("colorscheme gruvbox")
end

local t_status, tokyonight = pcall(require, "tokyonight")
if t_status then
	tokyonight.setup({
		dim_inactive = true,
	})
	vim.cmd("colorscheme tokyonight-night")
end

local nf_status, nightfox = pcall(require, "nightfox")
if nf_status then
	local palette = require("nightfox.palette").load("carbonfox")
	nightfox.setup({
		options = {
			styles = { comments = "italic", keywords = "bold", types = "italic,bold" },
			dim_inactive = true,
			inverse = { -- Inverse highlight for different types
				match_paren = true,
			},
		},
		palettes = {
			carbonfox = {
				bg0 = palette.bg1,
				bg1 = palette.bg0,
			},
		},
	})
	vim.cmd("colorscheme carbonfox")
	-- vim.cmd("colorscheme nightfox")
end
