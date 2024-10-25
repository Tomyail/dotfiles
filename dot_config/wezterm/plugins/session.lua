return {
	setup = function(wezterm)
		local act = wezterm.action
    local mux = wezterm.mux
		return {
			unix_domains = {
				{
					name = "unix",
				},
			},

			keys = {

				-- Attach to muxer
				{
					key = "a",
					mods = "LEADER",
					action = act.AttachDomain("unix"),
				},

				-- Detach from muxer
				{
					key = "d",
					mods = "LEADER",
					action = act.DetachDomain({ DomainName = "unix" }),
				},

				{
					key = "$",
					mods = "LEADER|SHIFT",
					action = act.PromptInputLine({
						description = "Enter new name for session",
						action = wezterm.action_callback(function(window, pane, line)
							if line then
								mux.rename_workspace(window:mux_window():get_workspace(), line)
							end
						end),
					}),
				},

				{
					key = "s",
					mods = "LEADER",
					action = act.ShowLauncherArgs({ flags = "WORKSPACES" }),
				},
			},
		}
	end,
}
