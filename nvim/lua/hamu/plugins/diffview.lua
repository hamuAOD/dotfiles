return
{
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  config = function()
    require("diffview").setup()

    vim.keymap.set('n', '<Leader>gd', '<CMD>DiffviewOpen HEAD~1<CR>', {desc = "Diff between previous commit", noremap = true, silent = true})
    vim.keymap.set('n', '<Leader>gh', '<CMD>DiffviewFileHistory %<CR>', {desc = "Show commit history", noremap = true, silent = true})
    vim.keymap.set('n', '<Leader>gx', '<CMD>DiffviewClose<CR>', {desc = "Close Diffview", noremap = true, silent = true})
  end
}
