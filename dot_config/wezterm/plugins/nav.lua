return {

	setup = function(wezterm)
		local function is_vim(pane)
			-- Get the foreground process name
			local process_name = pane:get_foreground_process_name()

			-- Check if the process name is valid
			if process_name then
				-- This gsub is equivalent to POSIX basename(3)
				-- Given "/foo/bar" returns "bar"
				-- Given "c:\\foo\\bar" returns "bar"
				process_name = string.gsub(process_name, "(.*[/\\])(.*)", "%2")
				return process_name == "nvim" or process_name == "vim"
			end

			-- Return false if process_name is nil
			return false
		end
		local direction_keys = {
			h = "Left",
			j = "Down",
			k = "Up",
			l = "Right",
		}
		local function split_nav(resize_or_move, key)
			return {
				key = key,
				mods = resize_or_move == "resize" and "META" or "CTRL",
				action = wezterm.action_callback(function(win, pane)
					if is_vim(pane) then
						-- pass the keys through to vim/nvim
						win:perform_action({
							SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
						}, pane)
					else
						if resize_or_move == "resize" then
							win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
						else
							win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
						end
					end
				end),
			}
		end
		return {
			keys = {
				split_nav("move", "h"),
				split_nav("move", "j"),
				split_nav("move", "k"),
				split_nav("move", "l"),
				-- resize panes
				split_nav("resize", "h"),
				split_nav("resize", "j"),
				split_nav("resize", "k"),
				split_nav("resize", "l"),
			},
		}
	end,
}
