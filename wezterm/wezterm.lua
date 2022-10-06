local wezterm = require("wezterm")
local act = wezterm.action
local scheme = wezterm.get_builtin_color_schemes()["nord"]
require("on")

local keys = {
  { key = '\\', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = "h", mods = "LEADER", action = act({ ActivatePaneDirection = "Left" }) },
  { key = "l", mods = "LEADER", action = act({ ActivatePaneDirection = "Right" }) },
  { key = "k", mods = "LEADER", action = act({ ActivatePaneDirection = "Up" }) },
  { key = "j", mods = "LEADER", action = act({ ActivatePaneDirection = "Down" }) },
  { key = "H", mods = "LEADER", action = act({ AdjustPaneSize = { "Left", 5 } }) },
  { key = "L", mods = "LEADER", action = act({ AdjustPaneSize = { "Right", 5 } }) },
  { key = "K", mods = "LEADER", action = act({ AdjustPaneSize = { "Up", 5 } }) },
  { key = "J", mods = "LEADER", action = act({ AdjustPaneSize = { "Down", 5 } }) },
  { key = "z", mods = "LEADER", action="TogglePaneZoomState" },
  -- tabs
  { key = "t", mods = "CMD", action = act.SpawnTab("DefaultDomain") },
  { key = "w", mods = "CMD", action = act.CloseCurrentTab({ confirm = true }) },
  { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
}

local colors = {
    tab_bar = {
      background = scheme.background,
      new_tab = { bg_color = "#2e3440", fg_color = scheme.ansi[8], intensity = "Bold" },
      new_tab_hover = { bg_color = scheme.ansi[1], fg_color = scheme.brights[8], intensity = "Bold" },
      -- format-tab-title
      active_tab = { bg_color = "#121212", fg_color = "#FCE8C3" },
      inactive_tab = { bg_color = scheme.background, fg_color = "#FCE8C3" },
      inactive_tab_hover = { bg_color = scheme.ansi[1], fg_color = "#FCE8C3" },
    },
}

local config = {
  window_decorations = "RESIZE",
  window_background_opacity = 0.9,
  tab_max_width = 16,
  tab_bar_at_bottom = true,
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  colors = colors,

  leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = keys
}

return config
