return {
	setup = function(wezterm)
		return {
			keys = {
				{
					mods = "LEADER",
					key = "-",
					action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
				},
				{
					mods = "LEADER",
					key = "_",
					action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
				},
			},
		}
	end,
}
