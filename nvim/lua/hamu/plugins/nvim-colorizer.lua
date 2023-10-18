return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufRead", "BufNewFile" },
  -- event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup()
  end,
}
