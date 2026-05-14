local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = 'GitHub Dark'
config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 12.0
config.initial_cols = 120
config.initial_rows = 30
config.default_gui_startup_args = { "start", "--position", "600,450"}
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.default_prog = { "pwsh" }
else
  config.default_prog = { "zsh" }
end

-- -- Inspired from https://github.com/dragonlobster/wezterm-config
-- wezterm.on('update-right-status', function(window, pane)
--   local name = window:active_key_table()
--   if name then
--     name = 'TABLE: ' .. name
--   end
--   window:set_right_status(name or '')
-- end)

-- config.leader = { key = 'Space', mods = 'CTRL|SHIFT' }
-- config.keys = {
--   {
--     mods = "LEADER",
--     key = "c",
--     action = wezterm.action.SpawnTab "CurrentPaneDomain",
--   },
--   {
--     mods = "LEADER",
--     key = "x",
--     action = wezterm.action.CloseCurrentPane { confirm = true }
--   },
--   {
--     mods = "LEADER",
--     key = "b",
--     action = wezterm.action.ActivateTabRelative(-1)
--   },
--   {
--     mods = "LEADER",
--     key = "n",
--     action = wezterm.action.ActivateTabRelative(1)
--   },
--   {
--     mods = "LEADER",
--     key = "|",
--     action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
--   },
--   {
--     mods = "LEADER",
--     key = "-",
--     action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
--   },
--   {
--     mods = "LEADER",
--     key = "h",
--     action = wezterm.action.ActivatePaneDirection "Left"
--   },
--   {
--     mods = "LEADER",
--     key = "j",
--     action = wezterm.action.ActivatePaneDirection "Down"
--   },
--   {
--     mods = "LEADER",
--     key = "k",
--     action = wezterm.action.ActivatePaneDirection "Up"
--   },
--   {
--     mods = "LEADER",
--     key = "l",
--     action = wezterm.action.ActivatePaneDirection "Right"
--   },
--   {
--     mods = "LEADER",
--     key = "LeftArrow",
--     action = wezterm.action.AdjustPaneSize { "Left", 5 }
--   },
--   {
--     mods = "LEADER",
--     key = "RightArrow",
--     action = wezterm.action.AdjustPaneSize { "Right", 5 }
--   },
--   {
--     mods = "LEADER",
--     key = "DownArrow",
--     action = wezterm.action.AdjustPaneSize { "Down", 5 }
--   },
--   {
--     mods = "LEADER",
--     key = "UpArrow",
--     action = wezterm.action.AdjustPaneSize { "Up", 5 }
--   },
-- }

-- for i = 0, 9 do
--   -- leader + number to activate that tab
--   table.insert(config.keys, {
--     key = tostring(i),
--     mods = "LEADER",
--     action = wezterm.action.ActivateTab(i),
--   })
-- end

return config