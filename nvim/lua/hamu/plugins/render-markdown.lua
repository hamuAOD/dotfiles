return
{
  'MeanderingProgrammer/render-markdown.nvim',
  event = { "BufRead", "BufNewFile" },
  opts = {},
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'echasnovski/mini.nvim',
  },

  config = function()
    require('render-markdown').setup({
      heading = {
        sign = false,
        -- icons = { '① ', '② ', '③ ', '④ ', '⑤ ', '⑥ ' },
        icons = {'', '', '', '', '', ''},
        width = 'block',
        min_width = 40,
      },
      code = {
        width = 'block', -- block, full
      },
      dash = {
        width = 150,
      }
    })

    local keymap = vim.keymap
    local NS = { noremap = true, silent = true }

    keymap.set('n', '<Leader>tr', '<CMD>RenderMarkdown toggle<CR>', {desc = "Render-Markdown"}, NS)
  end,
}
