return
{
  "FotiadisM/tabset.nvim",
  event = { "BufRead", "BufNewFile" },

  config = function()
    require("tabset").setup({
      defaults = {
        tabwidth = 2,
        expandtab = true
      },
      language = {
        go = {
          tabwidth = 4,
          expandtab = false
        },
        python = {
          tabwidth = 4,
          expandtab = true
        },
        {
          filetypes = { "text", "markdown" },
          config = {
            tabwidth = 4,
            expandtab = false
          }
        }
      }
    })
  end,
}
