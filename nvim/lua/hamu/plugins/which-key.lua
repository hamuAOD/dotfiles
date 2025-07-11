return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200

    local wk = require("which-key")
    wk.setup()
    wk.add({
      { "<Leader>c", group = "etc" },
      { "<Leader>g", group = "git" },
      { "<Leader>f", group = "Telescope" },
      { "<Leader>m", group = "Markdown" },
      { "<Leader>p", group = "Pane" },
      { "<Leader>t", group = "Toggle*" },
      { "<Leader>tf", group = "Toggle FOLD" },
    })
  end,
}
