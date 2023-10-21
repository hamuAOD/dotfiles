return
{
  'xiyaowong/transparent.nvim',
  event = "VeryLazy",
  config = function()
    require("transparent").setup({
      enable = true,
      groups = { -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLineNr', 'EndOfBuffer',
      },
      extra_groups = {
        -- "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
        "NvimTreeNormal",
      }, -- table: additional groups that should be cleared
      exclude_groups = {}, -- table: groups you don't want to clear
    })

    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
    -- require('transparent').clear_prefix('lualine')
    -- keymap
    vim.keymap.set('n', '<Leader>tt', ':TransparentToggle<CR>', {desc = "Toggle Transparent"}, { noremap = true, silent = true })
  end
}
