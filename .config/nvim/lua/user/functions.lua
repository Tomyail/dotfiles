local M = {}

vim.cmd([[
  function Test()
    %SnipRun
    call feedkeys("\<esc>`.")
  endfunction
  function TestI()
    let b:caret = winsaveview()
    %SnipRun
    call winrestview(b:caret)
  endfunction
]])

function M.sniprun_enable()
	vim.cmd([[
    %SnipRun
    augroup _sniprun
     autocmd!
     autocmd TextChanged * call Test()
     autocmd TextChangedI * call TestI()
    augroup end
  ]])
	vim.notify("Enabled SnipRun")
end

function M.disable_sniprun()
	M.remove_augroup("_sniprun")
	vim.cmd([[
    SnipClose
    SnipTerminate
    ]])
	vim.notify("Disabled SnipRun")
end

function M.toggle_sniprun()
	if vim.fn.exists("#_sniprun#TextChanged") == 0 then
		M.sniprun_enable()
	else
		M.disable_sniprun()
	end
end

function M.remove_augroup(name)
	if vim.fn.exists("#" .. name) == 1 then
		vim.cmd("au! " .. name)
	end
end

vim.cmd([[ command! SnipRunToggle execute 'lua require("user.functions").toggle_sniprun()' ]])

-- get length of current word
function M.get_word_length()
	local word = vim.fn.expand("<cword>")
	return #word
end

function M.toggle_option(option)
	local value = not vim.api.nvim_get_option_value(option, {})
	vim.opt[option] = value
	vim.notify(option .. " set to " .. tostring(value))
end

function M.toggle_tabline()
	local value = vim.api.nvim_get_option_value("showtabline", {})

	if value == 2 then
		value = 0
	else
		value = 2
	end

	vim.opt.showtabline = value

	vim.notify("showtabline" .. " set to " .. tostring(value))
end

local diagnostics_active = true
function M.toggle_diagnostics()
	diagnostics_active = not diagnostics_active
	if diagnostics_active then
		vim.diagnostic.show()
	else
		vim.diagnostic.hide()
	end
end

function M.isempty(s)
	return s == nil or s == ""
end

function M.get_buf_option(opt)
	local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
	if not status_ok then
		return nil
	else
		return buf_option
	end
end

function M.smart_quit()
	local bufnr = vim.api.nvim_get_current_buf()
	local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
	if modified then
		vim.ui.input({
			prompt = "You have unsaved changes. Quit anyway? (y/n) ",
		}, function(input)
			if input == "y" then
				vim.cmd("q!")
			end
		end)
	else
		vim.cmd("q!")
	end
end

function M.find_text_under_cursor_dir()
	local treeApi = require("nvim-tree.api")
	local current = treeApi.tree.get_node_under_cursor()
	if current == nil then
		vim.notify("no node selected")
		return
	end
	local type = current.fs_stat.type
	-- print(vim.inspect(current))
	local dir
	if type == "file" then
		dir = current.parent.absolute_path
	elseif type == "directory" then
		dir = current.absolute_path
	else
		vim.notify("unknown type" .. type)
	end
	print(dir)
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	--	builtin.live_grep({ cwd = dir })
	builtin.live_grep(themes.get_ivy({ cwd = dir }))

	--vim.api.nvim_command("Telescope live_grep theme=ivy cwd=" .. dir)
	-- require("telescope.builtin").live_grep({
	-- 		cwd = dir,
	-- 	})
end

function M.find_file_under_cursor_dir()
	local treeApi = require("nvim-tree.api")
	local current = treeApi.tree.get_node_under_cursor()
	if current == nil then
		vim.notify("no node selected")
		return
	end
	local type = current.fs_stat.type
	-- print(vim.inspect(current))
	local dir
	if type == "file" then
		dir = current.parent.absolute_path
	elseif type == "directory" then
		dir = current.absolute_path
	else
		vim.notify("unknown type" .. type)
	end
	print(dir)
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	--	builtin.live_grep({ cwd = dir })
	builtin.find_files(themes.get_dropdown({ cwd = dir, previewer = false }))

	--vim.api.nvim_command("Telescope live_grep theme=ivy cwd=" .. dir)
	-- require("telescope.builtin").live_grep({
	-- 		cwd = dir,
	-- 	})
end

function M.get_running_mode()
	local allowed_mode = { "basic", "enhanced", "deluxe" }
	local running_mode = os.getenv("NVIM_RUNNING_MODE")
	local function has_value(tab, val)
		for index, value in ipairs(tab) do
			if value == val then
				return true
			end
		end
		return false
	end

	if not has_value(allowed_mode, running_mode) then
		running_mode = "basic"
	end

	return running_mode
end

return M
