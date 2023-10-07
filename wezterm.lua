-- Pull in the wezterm API
local wezterm = require 'wezterm'

local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
--  https://wezfurlong.org/wezterm/config/lua/config/index.html
config.initial_cols = 130
config.initial_rows = 50

config.font = wezterm.font('HackGen35 Console NF', { weight = 'Bold', italic = false })
config.font_size = 13
config.window_background_opacity = 0.85
config.macos_window_background_blur = 12
config.color_scheme = 'Dracula'

-- and finally, return the configuration to wezterm
return config
