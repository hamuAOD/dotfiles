return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = { "BufRead", "BufNewFile" },
  priority = 2000,
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      gray       = '#44475a',
      lightgray  = '#5f6a94',
      orange     = '#ffb86c',
      purple     = '#bd93f9',
      red        = '#ff5555',
      yellow     = '#f1fa8c',
      green      = '#50fa7b',
      white      = '#f8f8f2',
      black      = '#282a36',
    }

    local my_dracula_theme = {
      normal = {
        a = { bg = colors.purple, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.gray, fg = colors.white },
      },
      insert = {
        a = { bg = colors.green, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.gray, fg = colors.white },
      },
      visual = {
        a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.gray, fg = colors.white },
      },
      replace = {
        a = { bg = colors.red, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.gray, fg = colors.white },
      },
      command = {
        a = { bg = colors.orange, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.gray, fg = colors.white },
      },
      inactive = {
        a = { bg = colors.gray, fg = colors.white, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.gray, fg = colors.white },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_dracula_theme,
        -- theme = 'dracula',
        component_separators = { left = '❱', right = '❰'},
        section_separators = { left = '', right = ''},
        -- Global Status Line
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          { "mode", },
        },
        lualine_b = {
          {
            'filename',
            newfile_status = true,
            symbols = {
              modified = '[+]',      -- Text to show when the file is modified.
              readonly = '[RO]',     -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
              newfile = '[New]',     -- Text to show for newly created file before first write
            }
          },
          { "branch", },
          { "diff", },
          { "diagnostics", },
        },
        lualine_c = {
          {
            "buffers",
            mode = 0, -- 0: Shows buffer name
                -- 1: Shows buffer index
                -- 2: Shows buffer name + buffer index
                -- 3: Shows buffer number
                -- 4: Shows buffer name + buffer number
            use_mode_colors = true,
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = {"progress"},
        lualine_z = {"location"},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
      },
    })

    vim.api.nvim_set_option('showmode', false)
    vim.o.laststatus = 3 -- enable Global Status Line
  end,
}
