return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200

    local wk = require("which-key")
    wk.setup()
    wk.add({
      { "<Leader>h", group = "hlchunk" },
      { "<Leader>f", group = "Telescope" },
      { "<Leader>t", group = "Toggle*" },
    })
  end,
}
