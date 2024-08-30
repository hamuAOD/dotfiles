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

    require('mini.cursorword').setup({
      vim.cmd [[highlight MiniCursorword guibg=darkcyan guifg=lightgray]]
    })

    require('mini.surround').setup({
      custom_surroundings = nil,
    })
  end,
}
