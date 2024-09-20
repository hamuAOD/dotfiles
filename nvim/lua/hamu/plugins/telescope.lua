return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    event = "VeryLazy",

    config = function()
      require("telescope").load_extension("noice")

      require('telescope').setup{
        defaults = {
          sorting_strategy = 'ascending',
        },
      }

      local NS = { noremap = true, silent = true }
      vim.keymap.set('n', '<Leader>b', ':Telescope buffers<CR>', {desc = "Buffers"}, NS)
      vim.keymap.set('n', '<Leader>r', ':Telescope registers<CR>', {desc = "Registers"}, NS)
      vim.keymap.set('n', '<C-/>', ':Telescope current_buffer_fuzzy_find<CR>', {desc = "Adv. Search"}, NS)
      vim.keymap.set('n', '<Leader>fb', ':Telescope buffers<CR>', {desc = "Buffers"}, NS)
      vim.keymap.set('n', '<Leader>fc', ':Telescope command_history<CR>', {desc = "Command History"}, NS)
      vim.keymap.set('n', '<Leader>ff', ':Telescope find_files<CR>', {desc = "Files"}, NS)
      vim.keymap.set('n', '<Leader>fg', ':Telescope live_grep<CR>', {desc = "Live Grep"}, NS)
      vim.keymap.set('n', '<Leader>fo', ':Telescope oldfiles<CR>', {desc = "Old Files"}, NS)
      vim.keymap.set('n', '<Leader>fr', ':Telescope registers<CR>', {desc = "Registers"}, NS)
      vim.keymap.set('n', '<Leader>fk', ":lua require'telescope.builtin'.keymaps{}<CR>", {desc = "keymaps"}, NS)

    end,
  },
  {
    "danielfalk/smart-open.nvim",
    event = "VeryLazy",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")

      vim.keymap.set("n", "<leader>o", function ()
        require("telescope").extensions.smart_open.smart_open()
      end, {desc = "Open file"}, { noremap = true, silent = true })
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    -- dependencies = {
    --   "nvim-telescope/telescope.nvim",
    --   "nvim-lua/plenary.nvim"
    -- },
    event = "VeryLazy",
    config = function ()
      require("telescope").load_extension "file_browser"

      vim.keymap.set("n", "<space>fe", function()
	      require("telescope").extensions.file_browser.file_browser()
      end, {desc = "Open Explorer"}, { noremap = true, silent = true })
    end,
  },
}
