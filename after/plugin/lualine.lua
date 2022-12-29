-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local as_status, auto_session = pcall(require, "auto-session-library")
if not as_status then
	return
end

-- configure lualine with modified theme
lualine.setup({
	sections = {
		lualine_c = {},
		lualine_x = { "searchcount", auto_session.current_session_name, "filetype" },
	},
	tabline = {
		lualine_a = {
			"buffers",
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	winbar = {
		lualine_a = {},
		lualine_b = {},
		-- lualine_c = { { "filename", path = 1 } },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	options = {
		globalstatus = true,
		section_separators = "",
		component_separators = "",
	},
})
