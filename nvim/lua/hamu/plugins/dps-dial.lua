return {
  "monaqa/dps-dial.vim",
  dependencies = { "vim-denops/denops.vim" },
  event = { "BufRead", "BufNewFile" },

  config = function()
    local keymap = vim.keymap
    local NS = { noremap = true, silent = true }

    keymap.set('n', '<C-a>', '<Plug>(dps-dial-increment)', NS)
    keymap.set('n', '<C-x>', '<Plug>(dps-dial-decrement)', NS)
    keymap.set('x', '<C-a>', '<Plug>(dps-dial-increment)', NS)
    keymap.set('x', '<C-x>', '<Plug>(dps-dial-decrement)', NS)
  end,
}
