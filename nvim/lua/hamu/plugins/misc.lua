return{
  {
    "sitiom/nvim-numbertoggle",
    event = "VeryLazy",
  },
  {
    'hotoolong/translate.nvim',
    event = { "BufRead", "BufNewFile" },
    config = function()
      vim.cmd([[let g:translate_copy_result = 1]])
      vim.keymap.set('v', '<Leader>tw', '<Plug>(VTranslate)', {desc = "Translate", noremap = true, silent = true})
    end,
  }
}
