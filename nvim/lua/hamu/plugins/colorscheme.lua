return {
  -- {
  --   "Mofiqul/dracula.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd[[colorscheme dracula]]
  --   end,
  --   -- 背景をTerminalに合わせる
  --   vim.cmd 'autocmd ColorScheme * highlight Normal ctermbg=none',
  --   vim.cmd 'autocmd ColorScheme * highlight LineNr ctermbg=none',
  -- },
  -- {
  --   "maxmx03/dracula.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function ()
  --     local dracula = require 'dracula'
  --     dracula.setup()
  --     vim.cmd.colorscheme 'dracula'
  --   end,
  --   -- 背景をTerminalに合わせる
  --   -- vim.cmd 'autocmd ColorScheme * highlight Normal ctermbg=none',
  --   -- vim.cmd 'autocmd ColorScheme * highlight LineNr ctermbg=none',
  -- },
  -- {
  --   'sainnhe/edge',
  --   priority = 1000,
  --   config = function()
  --     vim.g.edge_style = 'aura'
  --     vim.g.edge_better_performance = 1
  --     vim.cmd[[colorscheme edge]]
  --   end,
  --   -- 背景をTerminalに合わせる
  --   -- vim.cmd 'autocmd ColorScheme * highlight Normal ctermbg=none',
  --   -- vim.cmd 'autocmd ColorScheme * highlight LineNr ctermbg=none',
  -- },
  {
    'catppuccin/nvim',
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        -- [Flavour] latte, frappe, macchiato, mocha
        flavour = "mocha",
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
        term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,              -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,            -- percentage of the shade to apply to the inactive window
        },
        no_italic = true, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        }
      })
      vim.cmd[[colorscheme catppuccin]]
    end,
  },
}
