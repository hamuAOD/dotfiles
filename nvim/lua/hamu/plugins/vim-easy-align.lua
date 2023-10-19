return
{
  'junegunn/vim-easy-align',
  event = { "BufRead", "BufNewFile" },

  config = function()
    local keymap = vim.keymap
    local NS = { noremap = true, silent = true }

    keymap.set('n', '<Leader>ae', '<Plug>(EasyAlign)', {desc = "Easy-Align"}, NS)
    keymap.set('x', '<Leader>ae', '<Plug>(EasyAlign)', {desc = "Easy-Align"}, NS)
  end,
}
