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
      inactive   = '#7f8ab4',
    }

    local function selection_count()
      local mode = vim.fn.mode()
      if mode ~= "v" and mode ~= "V" and mode ~= "\22" then
        return ""
      end

      local start_pos = vim.fn.getpos("v")
      local end_pos = vim.fn.getpos(".")

      local start_line, start_col = start_pos[2], start_pos[3]
      local end_line, end_col = end_pos[2], end_pos[3]

      if start_line > end_line or (start_line == end_line and start_col > end_col) then
        start_line, end_line = end_line, start_line
        start_col, end_col = end_col, start_col
      end

      local lines = vim.fn.getline(start_line, end_line)
      if #lines == 0 then return "" end

      if #lines == 1 then
        local text = string.sub(lines[1], start_col, end_col)
        return " " .. vim.fn.strchars(text) .. " chars"
      end

      local count = 0
      for i, line in ipairs(lines) do
        if i == 1 then
          count = count + vim.fn.strchars(string.sub(line, start_col))
        elseif i == #lines then
          count = count + vim.fn.strchars(string.sub(line, 1, end_col))
        else
          count = count + vim.fn.strchars(line)
        end
      end

      return " " .. count .. " chars"
    end

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
        c = { bg = colors.gray, fg = colors.inactive },
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
            hide_filename_extension = true,
            use_mode_colors = true,
            -- buffers_color = {
            --   -- Same values as the general color option can be used here.
            --   active = 'lualine_{section}_normal',     -- Color for active buffer.
            --   inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
            -- },
            symbols = {
              modified = ' + ',      -- Text to show when the buffer is modified
              alternate_file = '#', -- Text to show to identify the alternate file
              directory =  '',     -- Text to show when the buffer is a directory
            },
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          selection_count,
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

    vim.o.showmode = false
    vim.o.laststatus = 3 -- enable Global Status Line
  end,
}
