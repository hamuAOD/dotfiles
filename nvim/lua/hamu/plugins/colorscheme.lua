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
  --   -- "rebelot/kanagawa.nvim",
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
  --   "Mofiqul/dracula.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function ()
  --     local dracula = require 'dracula'
  --     dracula.setup()
  --     vim.cmd.colorscheme 'dracula'
  --   end,
  -- },
  {
    "binhtran432k/dracula.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {},
    config = function ()
      local dracula = require 'dracula'
      dracula.setup()
      vim.cmd.colorscheme 'dracula'
    end,
  },
}
