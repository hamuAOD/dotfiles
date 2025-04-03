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

wezterm.on('gui-startup', function(cmd)
  -- not work without "tab, pane, "
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():set_position(50, 140)
    config.initial_cols = 130
    config.initial_rows = 50
  end
)

config.initial_cols = 130
config.initial_rows = 50
config.font = wezterm.font('HackGen35 Console NF', { weight = "Bold" })
-- config.font = wezterm.font('UDEV Gothic 35NFLG', { weight = 'Bold' })
config.font_size = 13
config.line_height = 1.2
config.cell_width = 1.0
config.window_padding = {
  left = '1.1cell',
  right = '1.1cell',
  top = '0.5cell',
  bottom = '0.5cell',
}
config.window_background_opacity = 0.90
config.macos_window_background_blur = 12
-- config.treat_east_asian_ambiguous_width_as_wide = true
config.window_close_confirmation = 'NeverPrompt'  -- AlwaysPrompt
-- Colorscheme
-- config.color_scheme = 'Dracula'
config.color_scheme = "Dracula (Official)"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
-- "TITLE", "RESIZE", "TITLE | RESIZE"
config.window_decorations = "TITLE | RESIZE"

--config.background = {
--  -- This is the deepest/back-most layer. It will be rendered first
--  {
--    source = {
--      File = '/Users/hamu/dotfiles/.warp/themes/Car Bomb - Meta.jpg',
--    },
--    width = '100%',
--    repeat_x = 'NoRepeat',
--    opacity = 0.30,
--    --attachment = { Parallax = 0.1 },
--  },
--}

-- config.window_background_gradient = {
--   orientation = 'Vertical',
--   colors = {
--     -- Blue
--     -- '#0f0c29', '#302b63', '#24243e',
--     -- Red
--     -- '#240a07', '#54211c', '#391f1f',
--     -- Grey
--     -- '#0f1113', '#1a1c1e', '#141618',
--     -- '#070915', '#272935', '#171925',
--     '#070915', '#272935', '#171925',
--   },
--   -- preset = "Warm",
--   interpolation = 'Linear',
--   blend = 'Rgb',
-- }

-- Key Configs
-- config.disable_default_key_bindings = true
config.leader = { key = 'q', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  {
    key = 'k',
    mods = 'CMD',
    action = act.Multiple {
      act.ClearScrollback 'ScrollbackAndViewport',
      act.SendKey { key = 'L', mods = 'CTRL' },
    },
  },
  { key = 'LeftArrow',  mods = 'OPT',    action = act{SendString="\x1bb"}},
  { key = 'RightArrow', mods = 'OPT',    action = act{SendString="\x1bf"}},
  { key = 'LeftArrow',  mods = 'CMD',    action = act{SendString="\x01"}},
  { key = 'RightArrow', mods = 'CMD',    action = act{SendString="\x05"}},
  { key = 'Backspace',  mods = 'CMD',    action = act{SendString="\x15"}},
  { key = 'Backspace',  mods = 'OPT',    action = act{SendString="\x1b\x7f"}},
  { key = 'c',          mods = 'LEADER', action = act.ActivateCopyMode},
  { key = 'q',          mods = 'LEADER', action = act.ActivateCopyMode},
  -- Pane
  { key = '[',          mods = 'CTRL',   action = act.PaneSelect},
  { key = ']',          mods = 'CTRL'  , action = act.ActivatePaneDirection 'Next'},
  { key = 'r',          mods = 'LEADER', action = act.RotatePanes 'Clockwise'},
  { key = 'a',          mods = 'LEADER', action = act.ActivatePaneDirection 'Next'},
  { key = 'LeftArrow',  mods = 'LEADER', action = act.ActivatePaneDirection 'Left'},
  { key = 'RightArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Right'},
  { key = 'UpArrow',    mods = 'LEADER', action = act.ActivatePaneDirection 'Up'},
  { key = 'DownArrow',  mods = 'LEADER', action = act.ActivatePaneDirection 'Down'},
  { key = 'h',          mods = 'LEADER', action = act.ActivatePaneDirection 'Left'},
  { key = 'l',          mods = 'LEADER', action = act.ActivatePaneDirection 'Right'},
  { key = 'k',          mods = 'LEADER', action = act.ActivatePaneDirection 'Up'},
  { key = 'j',          mods = 'LEADER', action = act.ActivatePaneDirection 'Down'},
  { key = 'w',          mods = 'LEADER', action = act.CloseCurrentPane{confirm = true}},
  { key = 't',          mods = 'LEADER', action = act.SpawnTab 'CurrentPaneDomain'},
  { key = 's',          mods = 'LEADER', action = act.SplitHorizontal{domain = 'CurrentPaneDomain'}},
  { key = 'v',          mods = 'LEADER', action = act.SplitVertical{domain = 'CurrentPaneDomain'}},
  -- Font size
  { key = '+',          mods = 'CMD',    action = act.IncreaseFontSize},
  { key = '-',          mods = 'CMD',    action = act.DecreaseFontSize},
  { key = '0',          mods = 'CTRL',   action = act.ResetFontAndWindowSize},
  -- { key = 'Backspace',  mods = 'CMD',  action = act.SendKey{ key = 'u', mods = 'CTRL' } },
  -- { key = 'L',          mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
  -- { key = 'p', mods = 'SHIFT|CTRL', action = wezterm.action.ActivateKeyTable { name = 'resize_pane', one_shot = false }}
  { key = 'p',          mods = 'LEADER', action = wezterm.action.ActivateKeyTable { name = 'resize_pane', one_shot = false }},
}

config.key_tables = {
  resize_pane = {
    { key = 'h', action = wezterm.action.AdjustPaneSize {"Left", 1} },
    { key = 'j', action = wezterm.action.AdjustPaneSize {"Down", 1} },
    { key = 'k', action = wezterm.action.AdjustPaneSize {"Up", 1} },
    { key = 'l', action = wezterm.action.AdjustPaneSize {"Right", 1} },
    { key = 'Escape', action = 'PopKeyTable' },
  },
}
-- NeoVim ZenMode
wezterm.on('user-var-changed', function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == "ZEN_MODE" then
    local incremental = value:find("+")
    local number_value = tonumber(value)
    if incremental ~= nil then
      while (number_value > 0) do
        window:perform_action(wezterm.action.IncreaseFontSize, pane)
        number_value = number_value - 1
      end
      overrides.enable_tab_bar = false
    elseif number_value < 0 then
      window:perform_action(wezterm.action.ResetFontSize, pane)
      overrides.font_size = nil
      overrides.enable_tab_bar = true
    else
      overrides.font_size = number_value
      overrides.enable_tab_bar = false
    end
  end
  window:set_config_overrides(overrides)
end)
-- and finally, return the configuration to wezterm
return config
