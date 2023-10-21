return
{
  'hotoolong/translate.nvim',
  config = function()
    vim.cmd([[let g:translate_copy_result = 1]])
    vim.keymap.set('v', '<Leader>tw', '<Plug>(VTranslate)', {desc = "Translate"}, { noremap = true, silent = true })
  end,
}
