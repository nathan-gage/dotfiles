local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- colors
config.use_fancy_tab_bar = false
config.colors = {
	tab_bar = {
		active_tab = {
			bg_color = '#1D1F21',
			fg_color = '#FFFEFE',
		}
	}
}
config.color_scheme = 'Tomorrow Night (Gogh)'
config.window_background_opacity = 0.993

-- fonts
config.font = wezterm.font 'Comic Code Ligatures'

return config
