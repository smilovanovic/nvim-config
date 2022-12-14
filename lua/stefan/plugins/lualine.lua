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
	-- options = { section_separators = "", component_separators = "" },
	sections = {
		lualine_x = { "searchcount", auto_session.current_session_name, "filetype" },
	},
})
