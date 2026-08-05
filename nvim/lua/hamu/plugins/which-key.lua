return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200
  end,
  config = function()
    local wk = require("which-key")
    wk.setup()
    wk.add({
      { "<Leader>a", group = "ClaudeCode" },
      { "<Leader>c", group = "etc" },
      { "<Leader>g", group = "git" },
      { "<Leader>f", group = "Find" },
      { "<Leader>m", group = "Markdown" },
      { "<Leader>p", group = "Pane" },
      { "<Leader>t", group = "Toggle*" },
      { "<Leader>y", group = "Yazi" },
      { "<Leader>tf", group = "Toggle FOLD" },
    })
  end,
}
