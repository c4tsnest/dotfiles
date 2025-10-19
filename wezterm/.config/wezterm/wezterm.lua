-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

config.use_ime = true

-- or, changing the font size and color scheme.
config.font_size = 8
config.font = wezterm.font_with_fallback {
	'0xProto Nerd Font',
	'0xProto Nerd Font Mono',
	"Noto Sans Mono CJK JP",
	"Noto Color Emoji",
}
-- config.color_scheme = 'AdventureTime'
config.color_scheme = 'GruvboxDark'
config.window_decorations = "RESIZE"

config.warn_about_missing_glyphs = false


-- Finally, return the configuration to wezterm:
return config
