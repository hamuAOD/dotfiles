return
{
  'junegunn/vim-easy-align',
  event = { "BufRead", "BufNewFile" },

  config = function()
    local keymap = vim.keymap
    local NS = { noremap = true, silent = true }

    keymap.set('n', '<Leader>ea', '<Plug>(EasyAlign)', NS)
    keymap.set('x', '<Leader>ea', '<Plug>(EasyAlign)', NS)
  end,

}
