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
  {
    "maxmx03/dracula.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function ()
      local dracula = require 'dracula'
      dracula.setup({
        colors = {
          IndentBlanklineChar = '#bd93f9',
        }
      })
      vim.cmd.colorscheme 'dracula'
    end,
    -- 背景をTerminalに合わせる
    -- vim.cmd 'autocmd ColorScheme * highlight Normal ctermbg=none',
    -- vim.cmd 'autocmd ColorScheme * highlight LineNr ctermbg=none',
  },
}
