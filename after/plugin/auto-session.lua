local status, autosession = pcall(require, "auto-session")
if not status then
	return
end

-- local nt_status, nvim_tree = pcall(require, "nvim-tree")
-- if not nt_status then
-- 	return
-- end
--
-- local function restore_nvim_tree()
-- 	nvim_tree.change_dir(vim.fn.getcwd())
-- end

local function close_nvim_tree()
	vim.cmd("silent! bd NvimTree_1")
end

autosession.setup({
	auto_session_create_enabled = false,
	post_restore_cmds = { close_nvim_tree },
	-- pre_restore_cmds = { "NvimTreeClose" },
	-- post_restore_cmds = { restore_nvim_tree },
})
