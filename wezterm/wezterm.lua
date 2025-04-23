local wezterm = require("wezterm")
local config = {}

-- Font Settings
config.font = wezterm.font("JetBrains Mono")

-- Theme Settings
config.color_scheme = "Catppuccin Mocha"
config.colors = { -- Color overides
	background = "black",
}

return config
