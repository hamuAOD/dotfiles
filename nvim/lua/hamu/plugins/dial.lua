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
        augend.date.new{
          pattern = "%Y年%m月%d日",
          default_kind = "day",
          -- if true, it does not match dates which does not exist, such as 2022/05/32
          only_valid = true,
          -- if true, it only matches dates with word boundary
          word = false,
        },
      },
    }

    local keymap = vim.keymap
    local NS = { noremap = true, silent = true }

    keymap.set('n', '<C-a>', '<Plug>(dial-increment)', NS)
    keymap.set('n', '<C-x>', '<Plug>(dial-decrement)', NS)
    keymap.set('x', '<C-a>', '<Plug>(dial-increment)', NS)
    keymap.set('x', '<C-x>', '<Plug>(dial-decrement)', NS)
    vim.keymap.set("n", "g<C-a>", function()
      require("dial.map").manipulate("increment", "gnormal")
    end)
    vim.keymap.set("n", "g<C-x>", function()
      require("dial.map").manipulate("decrement", "gnormal")
    end)
  end,
}
