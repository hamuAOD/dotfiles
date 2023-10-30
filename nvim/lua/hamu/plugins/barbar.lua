return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false

    local map = vim.api.nvim_set_keymap
    local NS = { noremap = true, silent = true }

    map('n', '<Leader>bp', '<Cmd>BufferPrevious<CR>', NS)
    map('n', '<Leader>bn', '<Cmd>BufferNext<CR>', NS)
    map('n', '<Leader>bs', '<Cmd>BufferPick<CR>', NS)
    map('n', '<Leader>bw', '<Cmd>BufferClose<CR>', NS)
  end,
  opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
