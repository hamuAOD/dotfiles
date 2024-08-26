return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200

    local wk = require("which-key")
    wk.setup()
    wk.add({
      { "<Leader>a", group = "Align" },
      { "<Leader>b", group = "Buffer" },
      { "<Leader>c", group = "hlchunk" },
      { "<Leader>e", desc = "Neo-Tree Toggle" },
      { "<Leader>f", group = "Telescope" },
      { "<Leader>g", group = "git" },
      { "<Leader>h", group = "Hop" },
      { "<Leader>t", group = "Toggle*" },
    })
  end,
}
