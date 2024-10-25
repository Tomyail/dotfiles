local wezterm = require("wezterm")
local config_dir = wezterm.config_dir
local plugins_dir = config_dir .. "/plugins"

package.path = package.path .. ";" .. plugins_dir .. "/?.lua"

local function merge_config(final_config, config)
	for key, value in pairs(config) do
		if type(value) == "table" and type(final_config[key]) == "table" then
			if #value > 0 and #final_config[key] > 0 then
				-- Strategy 1: Overwrite
				-- final_config[key] = value

				-- Strategy 2: Concatenate
				-- for _, v in ipairs(value) do
				--     table.insert(final_config[key], v)
				-- end

				-- Strategy 3: Concatenate with deduplication
				local set = {}
				for _, v in ipairs(final_config[key]) do
					set[v] = true
				end
				for _, v in ipairs(value) do
					if not set[v] then
						table.insert(final_config[key], v)
						set[v] = true
					end
				end
			else
				-- Recursively merge tables
				merge_config(final_config[key], value)
			end
		else
			-- Directly set the value
			final_config[key] = value
		end
	end
end

local final_config = wezterm.config_builder()

local function load_plugins()
	wezterm.log_info("plugins_dir: " .. plugins_dir)

	-- 遍历所有.lua文件并加载
	for _, file in ipairs(wezterm.read_dir(plugins_dir)) do
		wezterm.log_info("file: " .. file)
		if file:match("%.lua$") then
			-- local module_name = file:match("(.+)%.lua$")
			local module_name = file:match("([^/]+)%.lua$")
			-- wezterm.log_info("Loading module: " .. module_name)

			-- Load the module using loadfile
			local ok, module_or_error = pcall(require, module_name)

			if ok and module_or_error then
				wezterm.log_info("Successfully loaded module file: " .. module_name)
        local config = module_or_error.setup(wezterm)

				merge_config(final_config, config)
			else
				wezterm.log_error(string.format("Failed to load module %s: %s", module_name, tostring(module_or_error)))
			end
		end
	end

	return final_config
end

load_plugins()
-- wezterm.log_info(final_config)
-- wezterm.log_info(package.path)
return final_config
