return {
  'phaazon/hop.nvim',
  event = { "BufRead", "BufNewFile" },
  config = function()
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    vim.keymap.set("n", "<Leader>hl", "<CMD>HopLineStart<CR>", {desc = "Hop to Line Start"})
    vim.keymap.set("n", "<Leader>hw", "<CMD>HopWord<CR>",      {desc = "Hop to Word"})
    vim.keymap.set("n", "<Leader>hp", "<CMD>HopPattern<CR>",   {desc = "Hop to Char-Pattern"})
  end
}
