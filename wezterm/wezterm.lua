local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Helper function to simplify keybinding
local function bind(key, mods, action)
	return { key = key, mods = mods, action = action }
end

-- Appearance: Catppuccin Mocha with black background
config.color_scheme = "Catppuccin Mocha"
config.colors.background = "#000000"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 14
config.window_decorations = "NONE" -- No minimize/close/expand buttons
config.window_background_opacity = 0.95 -- Slight transparency for sleek look
config.default_cursor_style = "BlinkingBar" -- Sleek cursor

-- Behavior
config.enable_scroll_bar = false -- Minimalist, no scrollbar
config.enable_tab_bar = false

-- Tmux-like leader key: CTRL-a
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

-- Tmux-inspired keybindings
config.keys = {
	-- Pane splitting: CTRL-a | (vertical), CTRL-a - (horizontal)
	bind("|", "LEADER|SHIFT", wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" })),
	bind("-", "LEADER", wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" })),
	-- Pane navigation: CTRL-a h/j/k/l (like tmux/vim)
	bind("h", "LEADER", wezterm.action.ActivatePaneDirection("Left")),
	bind("j", "LEADER", wezterm.action.ActivatePaneDirection("Down")),
	bind("k", "LEADER", wezterm.action.ActivatePaneDirection("Up")),
	bind("l", "LEADER", wezterm.action.ActivatePaneDirection("Right")),
	-- Tab management: CTRL-a c (new tab), CTRL-a n/p (next/prev tab)
	bind("t", "LEADER", wezterm.action.SpawnTab("CurrentPaneDomain")),
	bind("n", "LEADER", wezterm.action.ActivateTabRelative(1)),
	bind("p", "LEADER", wezterm.action.ActivateTabRelative(-1)),
	-- Close pane: CTRL-a x
	bind("x", "LEADER", wezterm.action.CloseCurrentPane({ confirm = false })),
	-- Send Ctrl-a to terminal if pressed twice (tmux pass-through)
	bind("a", "LEADER", wezterm.action.SendKey({ key = "a", mods = "CTRL" })),
}

return config
