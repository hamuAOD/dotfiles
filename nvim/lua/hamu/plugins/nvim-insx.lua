return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufRead", "BufNewFile" },
  -- event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup()

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
