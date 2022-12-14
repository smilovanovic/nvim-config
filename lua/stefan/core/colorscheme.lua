-- set colorscheme with protected call
-- in case it isn't installed
local nf_status, nightfox = pcall(require, "nightfox")
if nf_status then
	nightfox.setup({
		options = {
			styles = { comments = "italic", keywords = "bold", types = "italic,bold" },
		},
	})
end

local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
