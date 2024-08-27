return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = "VeryLazy",

  config = function()
    require("telescope").load_extension("noice")

    local NS = { noremap = true, silent = true }
    vim.keymap.set('n', '<Leader>b', ':Telescope buffers<CR>', {desc = "Buffers"}, NS)
    vim.keymap.set('n', '<Leader>r', ':Telescope registers<CR>', {desc = "Registers"}, NS)
    vim.keymap.set('n', '<Leader>fb', ':Telescope buffers<CR>', {desc = "Buffers"}, NS)
    vim.keymap.set('n', '<Leader>fc', ':Telescope command_history<CR>', {desc = "Command History"}, NS)
    vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<CR>', {desc = "Files"}, NS)
    vim.keymap.set('n', '<Leader>fg', ':Telescope live_grep<CR>', {desc = "Live Grep"}, NS)
    vim.keymap.set('n', '<Leader>fo', ':Telescope oldfiles<CR>', {desc = "Old Files"}, NS)
    vim.keymap.set('n', '<Leader>fr', ':Telescope registers<CR>', {desc = "Registers"}, NS)
  end,
}
