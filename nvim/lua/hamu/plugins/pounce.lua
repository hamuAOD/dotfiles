return {
  'rlane/pounce.nvim',
  event = { "BufRead", "BufNewFile" },
  config = function()
    vim.keymap.set("n", "<Leader>p", ":Pounce<CR>", { desc = "Pounce" })
  end,
}
