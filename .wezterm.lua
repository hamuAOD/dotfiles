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
-- wezterm.on('gui-startup', function(cmd)
--   window:gui_window():set_position(0, 0)
--   end
-- )

config.initial_cols = 130
config.initial_rows = 50

config.font = wezterm.font('HackGen35 Console NF', { weight = 'Bold', italic = false })
config.font_size = 13
config.window_background_opacity = 0.94
config.macos_window_background_blur = 12
config.color_scheme = 'Dracula'

config.background = {
  -- This is the deepest/back-most layer. It will be rendered first
  {
    source = {
      File = '/Users/hamu/Library/Mobile Documents/com~apple~CloudDocs/Documents/Terminal/_warp/themes/Car Bomb - Meta.png',
    },
    width = '100%',
    repeat_x = 'NoRepeat',
    opacity = 0.25,
    --attachment = { Parallax = 0.1 },
  },
}

config.window_background_gradient = {
  orientation = 'Vertical',
  colors = {
    -- Blue
    -- '#0f0c29', '#302b63', '#24243e',
    -- Red
    -- '#240a07', '#54211c', '#391f1f',
    -- Grey
    '#0f0f0f', '#303030', '#171717',
  },
  -- preset = "Warm",
  interpolation = 'Linear',
  blend = 'Rgb',
}

config.leader = { key = 'a', mods = 'OPT', timeout_milliseconds = 1000 }

config.keys = {
  {
    key = 'k',
    mods = 'CMD',
    action = act.Multiple {
      act.ClearScrollback 'ScrollbackAndViewport',
      act.SendKey { key = 'L', mods = 'CTRL' },
    },
  },
  {
    key = 'Backspace',
    mods = 'CMD',
    action = act.SendKey { key = 'u', mods = 'CTRL' },
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.ActivateCopyMode
  },
  { key = 'L', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
}
-- and finally, return the configuration to wezterm
return config
