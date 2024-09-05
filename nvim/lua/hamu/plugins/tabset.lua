return
{
  "FotiadisM/tabset.nvim",
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
        }
      }
    })
  end,
}
