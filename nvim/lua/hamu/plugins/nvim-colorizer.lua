return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufRead", "BufNewFile" },
  -- event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup()

    local keymap = vim.keymap
    keymap.set("n", "<Leader>tz", "<CMD>ColorizerToggle<CR>", {desc = "Toggle Colorizer", noremap = true})
  end,
}
