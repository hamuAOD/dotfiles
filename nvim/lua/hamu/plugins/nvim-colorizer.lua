return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufRead", "BufNewFile" },
  -- event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup()

    local NS = { noremap = true, silent = true }
    vim.keymap.set('n', '<Leader>tn', ':ColorizerToggle<CR>', {desc = "Toggle Colorizer"}, NS)
  end,
}
