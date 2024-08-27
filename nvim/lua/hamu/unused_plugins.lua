return {
  -- FZF 2024.08.27
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      -- calling `setup` is optional for customization
      require"fzf-lua".setup({"fzf-native",winopts={preview={default="bat"}}})

      -- set keymaps
      local keymap = vim.keymap -- for conciseness
      local NS = { noremap = true, silent = true }

      keymap.set('n', '<leader>ff', "<cmd>lua require('fzf-lua').files()<CR>", {desc = "Find files"}, NS)
      keymap.set('n', '<leader>fl', "<cmd>lua require('fzf-lua').live_grep()<CR>", {desc = "Live Grep"}, NS)
      keymap.set('n', '<leader>fr', "<cmd>lua require('fzf-lua').oldfiles()<CR>", {desc = "Recent Files"}, NS)
      keymap.set('n', '<leader>fb', "<cmd>lua require('fzf-lua').buffers()<CR>", {desc = "Buffers"}, NS)
      keymap.set('n', '<leader>fr', "<cmd>lua require('fzf-lua').registers()<CR>", {desc = "Registers"}, NS)
    end,
  },
  -- vim-easy-align 2024.08.27
  {
    'junegunn/vim-easy-align',
    event = { "BufRead", "BufNewFile" },

    config = function()
      local keymap = vim.keymap
      local NS = { noremap = true, silent = true }

      keymap.set('n', '<Leader>ae', '<Plug>(EasyAlign)', {desc = "Easy-Align"}, NS)
      keymap.set('x', '<Leader>ae', '<Plug>(EasyAlign)', {desc = "Easy-Align"}, NS)
    end,
  },
}
