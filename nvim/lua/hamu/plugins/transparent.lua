return
{
  'xiyaowong/transparent.nvim',
  lazy = false,
  config = function()
    require("transparent").setup({
      groups = { -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLineNr', 'EndOfBuffer',
      },
      extra_groups = {
        -- "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
        "NvimTreeNormal",
        "NeoTreeNormal", "NeoTreeNormalNC"
      }, -- table: additional groups that should be cleared
      exclude_groups = {}, -- table: groups you don't want to clear
    })

    -- require("nvim-surround").setup({
    --   -- Configuration here, or leave empty to use defaults
    -- })
    -- require('transparent').clear_prefix('lualine')
    -- require('transparent').clear_prefix('NeoTree')
    -- keymap
    local NS = { noremap = true, silent = true }
    vim.keymap.set('n', '<Leader>tt', ':TransparentToggle<CR>', {desc = "Toggle Transparent"}, NS)

    vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, { "ExtraGroup" })
-- vimscript: let g:transparent_groups = extend(get(g:, 'transparent_groups', []), ["ExtraGroup"])
  end
}
