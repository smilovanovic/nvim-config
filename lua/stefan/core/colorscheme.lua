-- set colorscheme with protected call
-- in case it isn't installed

local gb_status, gruvbox = pcall(require, "gruvbox")
if gb_status then
	gruvbox.setup({
		dim_inactive = true,
	})
	vim.cmd("colorscheme gruvbox")
end
