local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Helper function to simplify keybinding
local function bind(key, mods, action)
	return { key = key, mods = mods, action = action }
end

-- Appearance: Catppuccin Mocha with black background
config.color_scheme = "Catppuccin Mocha"
config.colors = {
	background = "black",
}
config.font = wezterm.font("JetBrains Mono")
config.font_size = 14
-- No minimize/close/expand buttons.
-- RESIZE to allow Komorebi to manage the window
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95 -- Slight transparency for sleek look
config.default_cursor_style = "BlinkingBar" -- Sleek cursor

-- Behavior
config.enable_scroll_bar = false -- Minimalist, no scrollbar
config.enable_tab_bar = false

-- Set PowerShell as the default shell on Windows
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "powershell.exe", "-NoLogo" }
end

-- Enable and configure the status bar
config.show_new_tab_button_in_tab_bar = false -- Keep tab bar minimal if enabled
config.status_update_interval = 1000 -- Update every second
config.show_tabs_in_tab_bar = false

-- Tmux-like leader key: CTRL-a
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

-- Tmux-inspired keybindings
config.keys = {
	-- Pane navigation: CTRL-a h/j/k/l (like tmux/vim)
	bind("h", "LEADER", wezterm.action.ActivatePaneDirection("Left")),
	bind("j", "LEADER", wezterm.action.ActivatePaneDirection("Down")),
	bind("k", "LEADER", wezterm.action.ActivatePaneDirection("Up")),
	bind("l", "LEADER", wezterm.action.ActivatePaneDirection("Right")),

	-- Tab management: CTRL-a t (new window)
	bind("t", "LEADER", wezterm.action.SpawnWindow),

	-- Close pane: CTRL-a x
	bind("x", "LEADER", wezterm.action.CloseCurrentPane({ confirm = false })),

	-- Send Ctrl-a to terminal if pressed twice (tmux pass-through)
	bind("a", "LEADER", wezterm.action.SendKey({ key = "a", mods = "CTRL" })),
}
return config
