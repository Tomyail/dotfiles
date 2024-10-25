return {
	setup = function(wezterm)
		return {
			font = wezterm.font("Sarasa Mono Slab SC Nerd Font", { weight = "Regular" }),
			font_size = 14.0,
			inactive_pane_hsb = {
				saturation = 0.7,
				brightness = 0.3,
			},
		}
	end,
}
