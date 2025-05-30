local themes = {
  catppuccin = {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,

    config = function ()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = false,
        show_end_of_buffer = true,
      })
      vim.cmd[[colorscheme catppuccin]]
    end,
  },
  dracula_432k = {
    "binhtran432k/dracula.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {},
    config = function ()
      -- local dracula = require 'dracula'
      -- dracula.setup()
      -- vim.cmd.colorscheme 'dracula'

      require("dracula").setup({
        style = "default", -- The theme comes in three styles, `default`, a darker variant `soft` and `day`
        -- light_style = "day", -- The theme is used when the background is set to light
        transparent = false, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars, see below
          floats = "normal", -- style for floating windows
        },
        -- sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        -- day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        -- hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        -- dim_inactive = false, -- dims inactive windows
        -- lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

        --- You can override specific color groups to use other groups or a hex color
        --- function will be called with a ColorScheme table
        on_colors = function() end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with a Highlights and ColorScheme table
        on_highlights = function() end,
        use_background = "dark", -- can be light/dark/auto. When auto, background will be set to vim.o.background

        cache = true, -- When set to true, the theme will be cached for better performance

        prefer_undercurl = true, -- When set to true, the undercurl will be used place of underline in specific contexts.
      })
      vim.cmd[[colorscheme dracula]]
    end,
  },
}

return themes.dracula_432k
-- return themes.catppuccin
