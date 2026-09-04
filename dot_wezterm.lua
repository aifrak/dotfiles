local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
local cmdpicker = wezterm.plugin.require("https://github.com/abidibo/wezterm-cmdpicker")

config.color_scheme = "GitHub Dark"
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 10.0
config.initial_cols = 120
config.initial_rows = 30
config.default_gui_startup_args = { "start", "--position", "600,450" }
config.adjust_window_size_when_changing_font_size = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true
-- config.enable_csi_u_key_encoding = true
config.disable_default_key_bindings = true
config.enable_kitty_keyboard = false

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "pwsh" }
else
	config.default_prog = { "zsh" }
end

config.leader = { key = "Space", mods = "CTRL|SHIFT", timeout_milliseconds = 1000 }

config.keys = {
	{ key = "=", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "+", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "+", mods = "CTRL|SHIFT", action = act.ResetFontSize },
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },
	-- Fix SHIFT+ENTER to add new line (necessary for pi.dev)
	{
		key = "Enter",
		mods = "SHIFT",
		action = wezterm.action.SendString("\x1b[13;2u"),
	},
	-- Fix ALT+ENTER to send follow-up message in pi, instead of full screen
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.SendString("\x1b[13;3u"),
	},
	-- Add Paste on CTRL+SHIFT+V
	{
		key = "V",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	-- Avoid clearing prompt while copying (pi)
	{
		key = "C",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	-- Fix CTRL+SHIFT+F to open search in pi
	{ key = "F", mods = "CTRL|SHIFT", action = wezterm.action.SendString("\x1b[70;6u") },
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "b",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "LEADER",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "|",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
}

config.mouse_bindings = {
	-- Paste on Mouse RIGHT+CLICK
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
}

-- Inspired from https://github.com/dragonlobster/wezterm-config
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

for i = 0, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

-- call this LAST
cmdpicker.apply_to_config(config, {
	title = "Command Palette",
})

return config
