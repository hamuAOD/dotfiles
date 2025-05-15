return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = { "BufRead", "BufNewFile" },
  priority = 2000,
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      blue = "#65D1FF",
      green = "#3EFFC3",--#9ac47c",--"#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      red = "#FF4A4A",
      fg = "#c3ccdc",
      bg = "#112638",
      inactive_bg = "#2c3043",
    }

    local my_lualine_theme = {
      normal = {
        -- a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        -- a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        -- theme = my_lualine_theme,
        theme = 'dracula',
        -- theme = 'catppuccin',
        component_separators = { left = '❱', right = '❰'},
        section_separators = { left = '', right = ''},
        -- Global Status Line
        globalstatus = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          -- {
          --   'filename',
          --   symbols = {
          --     modified = '[+]',      -- Text to show when the file is modified.
          --     readonly = '[RO]',     -- Text to show when the file is non-modifiable or readonly.
          --     unnamed = '[No Name]', -- Text to show for unnamed buffers.
          --     newfile = '[New]',     -- Text to show for newly created file before first write
          --   }
          -- },
          {
            'buffers',
            mode = 4,
            use_mode_colors = true,
            buffers_color = {
              inactive = "lualine_c_inactive", -- Color for active buffer.
              active = "lualine_a_inactive", -- Color for inactive buffer.
            },
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = {'progress'},
        lualine_z = {'location'},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
    })

    vim.api.nvim_set_option('showmode', false)
    vim.o.laststatus = 3 -- enable Global Status Line
  end,
}
