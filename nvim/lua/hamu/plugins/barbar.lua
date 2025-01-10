return
{
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  event = "VeryLazy",
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released

  config = function ()
    require'barbar'.setup ({
      sidebar_filetypes = {
        ['neo-tree'] = {event = 'BufWipeout', text = 'Neo-tree'},
      },
    })

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<C-p>', '<CMD>BufferPrevious<CR>', {desc = "Buffer Previous"}, opts)
    vim.keymap.set('n', '<C-n>', '<CMD>BufferNext<CR>', {desc = "Buffer Next"}, opts)
    vim.keymap.set('n', '<C-w>', '<CMD>BufferClose<CR>', {desc = "Buffer Delete"}, opts)
    vim.keymap.set('n', '<C-,>', '<CMD>BufferMovePrevious<CR>', {desc = "Move Buffer Previous"}, opts)
    vim.keymap.set('n', '<C-.>', '<CMD>BufferMoveNext<CR>', {desc = "Move Buffer Next"}, opts)
  end,
}
