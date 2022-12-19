-- set colorscheme with protected call
-- in case it isn't installed
local nf_status, nightfox = pcall(require, "nightfox")
if nf_status then
	nightfox.setup({
		options = {
			styles = { comments = "italic", keywords = "bold", types = "italic,bold" },
		},
	})
	vim.cmd("colorscheme nightfox")
end

local gb_status, gruvbox = pcall(require, "gruvbox")
if gb_status then
	gruvbox.setup({
		dim_inactive = true,
	})
	vim.cmd("colorscheme gruvbox")
end
