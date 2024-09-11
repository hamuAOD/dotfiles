return {
  "folke/zen-mode.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function ()
    vim.keymap.set('n', '<Leader>z', '<CMD>ZenMode<CR>', {desc = "ZenMode"}, { noremap = true, silent = true })
  end
}
