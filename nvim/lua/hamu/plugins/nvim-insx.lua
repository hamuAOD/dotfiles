return {
  "hrsh7th/nvim-insx",
  event = { "BufRead", "BufNewFile" },
  commit = "02fe0f3b0e6eeb5c60ffedacadda0274a8d2b187",

  config = function()
    require("insx.preset.standard").setup()

    local insx = require('insx')

    insx.add(
      "'",
      insx.with(require('insx.recipe.auto_pair')({
        open = "'",
        close = "'"
      }), {
        insx.with.in_string(false),
        insx.with.in_comment(false),
        insx.with.nomatch([[\\\%#]]),
        insx.with.nomatch([[\a\%#]])
      })
    )
  end,
}
