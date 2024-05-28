return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200

    local wk = require("which-key")
    wk.setup()
    wk.register({
      ["<Leader>"] = {
        a = { name = "+Align", },
        b = { name = "+Buffer", },
        e = { "Neo-Tree Toggle" },
        f = { name = "+fzf", },
        g = { name = "+git", },
        h = { name = "+Hop", },
        m = { name = "+Markdown", },
        t = { name = "+Toggle*", },
      },
    })
  end,
}
