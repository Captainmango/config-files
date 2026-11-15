local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.set_environment_variables = {
	TERM = "xterm-256color",
}

config.window_decorations = "TITLE | RESIZE"
config.initial_cols = 100
config.initial_rows = 25
config.window_padding = {
	left = 6,
	right = 6,
	top = 6,
	bottom = 6,
}

config.scrollback_lines = 5000

config.font = wezterm.font("MesloLGSDZ Nerd Font")
config.font_size = 16.0

config.enable_tab_bar = false
config.enable_scroll_bar = true

config.colors = {
	foreground = "#93a1a1",
	background = "#002b36",
	cursor_bg = "#b1c1b1",
	cursor_fg = "#002b36",
	ansi = {
		"#444444",
		"#d70000",
		"#5fd700",
		"#d7af00",
		"#005faf",
		"#6c71c4",
		"#2aa198",
		"#e4e4e4",
	},
	brights = {
		"#6c6c6c",
		"#d70000",
		"#5fd700",
		"#d7af00",
		"#005faf",
		"#6c71c4",
		"#2aa198",
		"#e4e4e4",
	},
	indexed = {
		[16] = "#cb4b16",
		[17] = "#d33682",
		[18] = "#073642",
		[19] = "#586e75",
		[20] = "#839496",
		[21] = "#eee8d5",
	},
}

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = "NONE",
		action = wezterm.action.ScrollByCurrentEventWheelDelta,
	},
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = "NONE",
		action = wezterm.action.ScrollByCurrentEventWheelDelta,
	},
}

return config
