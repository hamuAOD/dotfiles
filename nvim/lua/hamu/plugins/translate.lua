return
{
  'hotoolong/translate.nvim',
  event = { "BufRead", "BufNewFile" },
  config = function()
    local NS = { noremap = true, silent = true }
    vim.cmd([[let g:translate_copy_result = 1]])
    vim.keymap.set('v', '<Leader>tw', '<Plug>(VTranslate)', {desc = "Translate"}, NS)
  end,
}
