return
{
  'echasnovski/mini.nvim',
  version = false,
  event = "VeryLazy",
  config = function()
    require("mini.ai").setup()

    require("mini.align").setup({
      mappings = {
        start = 'ga',
        start_with_preview = 'gA',
      },
    })

    require('mini.completion').setup()

    require('mini.cursorword').setup({
      vim.cmd [[highlight MiniCursorword guibg=darkcyan guifg=lightgray]]
    })

    require('mini.surround').setup({
      mappings = {
        add = 'sa', -- Add surrounding in Normal and Visual modes
        delete = 'sd', -- Delete surrounding
        find = 'sf', -- Find surrounding (to the right)
        find_left = 'sF', -- Find surrounding (to the left)
        highlight = 'sh', -- Highlight surrounding
        replace = 'sr', -- Replace surrounding
        update_n_lines = 'sn', -- Update `n_lines`

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    })
  end,
}
