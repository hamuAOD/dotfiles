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
  -- sidebar 2024.08.28
  {
    'sidebar-nvim/sidebar.nvim',
    event = { "BufRead", "BufNewFile" },
    lazy = false,

    config = function ()
      require("sidebar-nvim").setup({
        side = "right",
        datetime = {
          icon = "",
          format = "%a %b %d, %H:%M",
          clocks = {
              { name = "local" }
          }
        },
        buffers = {
          icon = "",
          ignored_buffers = {},     -- ignore buffers by regex
          sorting = "id",           -- alternatively set it to "name" to sort by buffer name instead of buf id
          show_numbers = true,      -- whether to also show the buffer numbers
          ignore_not_loaded = true, -- whether to ignore not loaded buffers
          ignore_terminal = true,   -- whether to show terminal buffers in the list
        },
        sections = { "datetime", "buffers", "git", "symbols", "diagnostics" },
      })

      local NS = { noremap = true, silent = true }
      vim.keymap.set('n', '<Leader>tb', '<CMD>SidebarNvimToggle<CR>', {desc = "Toggle Sidebar"}, NS)
    end,
  },
  -- hop 2024.08.29
  {
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
}
