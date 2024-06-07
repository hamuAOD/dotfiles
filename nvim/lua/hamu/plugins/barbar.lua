return {
  'romgrk/barbar.nvim',
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false

    require'barbar'.setup {
      animation = true,
      auto_hide = false,
      insert_at_end = true,
      insert_at_start = false,
    }

    local map = vim.api.nvim_set_keymap
    local NS = { noremap = true, silent = true }

    map('n', '<Leader>bp', '<Cmd>BufferPrevious<CR>', NS)
    map('n', '<Leader>bn', '<Cmd>BufferNext<CR>', NS)
    map('n', '<Leader>bs', '<Cmd>BufferPick<CR>', NS)
    map('n', '<Leader>bd', '<Cmd>BufferDelete<CR>', NS)
  end,
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
