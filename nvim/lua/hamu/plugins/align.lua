return {
  'Vonr/align.nvim',
  branch = "v2",
  lazy = true,
  init = function()
    -- Create your mappings here
    ---- Aligns to 1 character
    vim.keymap.set('x', '<Leader>aa',
      function()
        require'align'.align_to_char({
        length = 1,
      })
    end,
    NS
    )
  end,
}
