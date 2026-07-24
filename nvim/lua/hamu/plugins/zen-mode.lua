return {
  "folke/zen-mode.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      wezterm = {
        enabled = true,
        font = "+4",
      },
    },
  },
  config = function ()
    vim.keymap.set('n', '<Leader>tz', '<CMD>ZenMode<CR>', {desc = "ZenMode", noremap = true, silent = true })
  end
}
