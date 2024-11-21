return {
	setup = function(wezterm)
		local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
		resurrect.periodic_save()
		return {
			keys = {
				{
					mods = "LEADER|CTRL",
					key = "s",
					action = wezterm.action_callback(function(win, pane)
						wezterm.log_info("Saved state")
						resurrect.save_state(resurrect.workspace_state.get_workspace_state())
						-- resurrect.tab_state.save_tab_action()
						resurrect.window_state.save_window_action()
						wezterm.log_info("Saved state")
					end),
				},
				{
					mods = "LEADER|CTRL",
					key = "r",
					action = wezterm.action_callback(function(win, pane)
						wezterm.log_info("Load state")
						resurrect.fuzzy_load(win, pane, function(id, label)
							local type = string.match(id, "^([^/]+)") -- match before '/'
							id = string.match(id, "([^/]+)$") -- match after '/'
							id = string.match(id, "(.+)%..+$") -- remove file extention
							local opts = {
								window = win:mux_window(),
								relative = true,
								restore_text = true,
								on_pane_restore = resurrect.tab_state.default_on_pane_restore,
							}
							if type == "workspace" then
								local state = resurrect.load_state(id, "workspace")
								resurrect.workspace_state.restore_workspace(state, opts)
							elseif type == "window" then
								local state = resurrect.load_state(id, "window")
								resurrect.window_state.restore_window(pane:window(), state, opts)
							elseif type == "tab" then
								local state = resurrect.load_state(id, "tab")
								resurrect.tab_state.restore_tab(pane:tab(), state, opts)
							end
						end)
					end),
				},
			},
		}
	end,
}
