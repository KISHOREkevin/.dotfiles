-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha (Gogh)'
--config.enable_scroll_bar = true
config.font = wezterm.font 'ComicShannsMono Nerd Font'
config.font_size = 15
config.enable_tab_bar = false
config.audible_bell= 'Disabled'
-- disable the warning of missiing glyphs ---
config.warn_about_missing_glyphs = false
-- startup fullscreen ---
local mux = wezterm.mux
wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

-- and finally, return the configuration to wezterm
return config
