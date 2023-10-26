return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500

    local wk = require("which-key")
    wk.setup()
    wk.register({
      ["<Leader>"] = {
        a = { name = "+Align", },
        b = { name = "+Buffer", },
        e = { name = "+NvimTree", },
        f = { name = "+fzf", },
        g = { name = "+git", },
        h = { name = "+Hop", },
        m = { name = "+Markdown", },
        t = { name = "+Toggle*", },
      },
    })
    -- wk.register({
    --   -- map
    --   a = {
    --     name = "+Align*",
    --   },
    --   -- opt
    --   {
    --     -- prefix = "<Leader>",
    --     prefix = "",
    --   },
    -- })
  end,
}
