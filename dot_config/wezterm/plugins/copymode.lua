return {
	setup = function(wezterm)
		return {
			keys = {
				{
					key = "Enter",
					mods = "LEADER",
					action = wezterm.action.ActivateCopyMode,
				},
			},
		}
	end,
}
