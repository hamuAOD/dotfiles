return {
  -- 'phaazon/hop.nvim',
  'smoka7/hop.nvim',
  event = { "BufRead", "BufNewFile" },
  config = function()
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

    local NS = { noremap = true, silent = true }
    vim.keymap.set("n", "<Leader>hl", "<CMD>HopLineStart<CR>", {desc = "Hop to Line Start"}, NS)
    vim.keymap.set("n", "<Leader>hw", "<CMD>HopWord<CR>",      {desc = "Hop to Word"}, NS)
    vim.keymap.set("n", "<Leader>hp", "<CMD>HopPattern<CR>",   {desc = "Hop to Char-Pattern"}, NS)
  end
}
