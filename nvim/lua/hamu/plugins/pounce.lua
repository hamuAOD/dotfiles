return {
  'rlane/pounce.nvim',
  config = function()
    vim.keymap.set("n", "<Leader>p", ":Pounce<CR>", { desc = "Pounce" })
  end,
}
