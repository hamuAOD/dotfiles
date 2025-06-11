return
{
  'MeanderingProgrammer/render-markdown.nvim',
  event = { "BufRead", "BufNewFile" },
  ft = { "markdown" },
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
        -- width = 'block',
        -- min_width = 40,
      },
      checkbox = {
        checked = { scope_highlight = '@markup.strikethrough' },
      },
      code = {
        width = 'block', -- block, full
      },
      dash = {
        width = 150,
      }
    })

    vim.keymap.set('n', '<Leader>tr', '<CMD>RenderMarkdown toggle<CR>', {desc = "Render-Markdown", noremap = true, silent = true})
  end,
}
