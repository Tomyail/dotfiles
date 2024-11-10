return {
	setup = function(wezterm)
		return {
			font = wezterm.font("Sarasa Term SC Nerd", { weight = "Regular" }),
			font_size = 14.0,
			inactive_pane_hsb = {
				saturation = 0.7,
				brightness = 0.3,
			},
		}
	end,
}
