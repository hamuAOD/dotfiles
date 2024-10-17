return
{
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  config = function()
    require("diffview").setup()

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<Leader>gd', '<CMD>DiffviewOpen HEAD~1<CR>', {desc = "Diff between previous commit"}, opts)
    vim.keymap.set('n', '<Leader>gh', '<CMD>DiffviewFileHistory %<CR>', {desc = "Show commit history"}, opts)

  end
}
