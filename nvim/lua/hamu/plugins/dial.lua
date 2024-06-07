return {
  "monaqa/dial.nvim",
  dependencies = { "vim-denops/denops.vim" },
  event = { "BufRead", "BufNewFile" },

  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group{
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.hex,
        augend.date.alias["%Y/%m/%d"],
        augend.constant.alias.bool,
      },
    }

    local keymap = vim.keymap
    local NS = { noremap = true, silent = true }

    keymap.set('n', '<C-a>', '<Plug>(dial-increment)', NS)
    keymap.set('n', '<C-x>', '<Plug>(dial-decrement)', NS)
    keymap.set('x', '<C-a>', '<Plug>(dial-increment)', NS)
    keymap.set('x', '<C-x>', '<Plug>(dial-decrement)', NS)
  end,
}
