return {
  'Vonr/align.nvim',
  event = { "BufRead", "BufNewFile" },
  branch = "v2",
  lazy = true,
  init = function()
    -- Create your mappings here
    local NS = { noremap = true, silent = true }
    ---- Aligns to 1 character
    vim.keymap.set('x', '<Leader>aa',
      function()
        require'align'.align_to_char({
          length = 1,
        })
      end,
      { desc = "Aligns to 1 character" },
      NS
    )
    ---- Aligns to 2 character
    vim.keymap.set('x', '<Leader>ad',
      function()
        require'align'.align_to_char({
          preview = true,
          length = 2,
        })
      end,
      { desc = "Aligns to 2 character" },
      NS
    )
    -- Aligns to a string with previews
    vim.keymap.set('x', '<Leader>aw',
      function()
        require'align'.align_to_string({
          preview = true,
          regex = false,
        })
      end,
      { desc = "Aligns to a string with previews" },
      NS
    )
    -- Aligns to a Vim regex with previews
    vim.keymap.set('x', '<Leader>ar',
      function()
        require'align'.align_to_string({
          preview = true,
          regex = true,
        })
      end,
      { desc = "Aligns to a Vim regex with previews" },
      NS
    )
  end,
}
