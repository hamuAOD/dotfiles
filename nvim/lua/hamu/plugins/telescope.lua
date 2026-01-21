return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    cmd = { "Telescope" }, -- ":Telescope"実行後にdependenciesが読み込まれる
    dependencies = {
      'nvim-lua/plenary.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    -- event = "VeryLazy",

    config = function()
      require("telescope").load_extension("noice")

      require('telescope').setup({
        defaults = {
          -- preview = {
          --   treesitter = false,
          -- },
          sorting_strategy = 'ascending',
          -- デフォルト検索モードをFZFにする
          generic_sorter = require("telescope").extensions.fzf.native_fzf_sorter(),
          file_sorter = require("telescope").extensions.fzf.native_fzf_sorter(),
        },
        extensions = {
          fzf = {
            fuzzy = true,          -- あいまい検索を有効化
            override_generic_sorter = true, -- デフォルトのソートを置き換え
            override_file_sorter = true,    -- ファイルソートを置き換え
            case_mode = "smart_case",       -- 大文字小文字の扱いを柔軟に
          },
        },
      })
      -- FZFエクステンションをロード
      require("telescope").load_extension("fzf")

      local keymap = vim.keymap -- for conciseness
      local telescope = require('telescope.builtin')
      local sorters = require('telescope.sorters')

      keymap.set('n', '<Leader>b', telescope.buffers, {desc = "Buffers", noremap = true, silent = true})
      keymap.set('n', '<Leader>fb', telescope.buffers, {desc = "Buffers", noremap = true, silent = true})
      keymap.set('n', '<Leader>r', '<CMD>Telescope registers<CR>', {desc = "Registers", noremap = true, silent = true})
      keymap.set('n', '<Leader>fr', '<CMD>Telescope registers<CR>', {desc = "Registers", noremap = true, silent = true})
      keymap.set('n', '<Leader>fc', '<CMD>Telescope command_history<CR>', {desc = "Command History", noremap = true, silent = true})
      keymap.set('n', '<Leader>ff', telescope.find_files, {desc = "Find Files", noremap = true, silent = true})
      keymap.set('n', '<Leader>fg', telescope.live_grep, {desc = "Live Grep", noremap = true, silent = true})
      keymap.set('n', '<Leader>fo', telescope.oldfiles, {desc = "Old Files", noremap = true, silent = true})
      keymap.set('n', '<Leader>fk', "<CMD>lua require'telescope.builtin'.keymaps{}<CR>", {desc = "keymaps", noremap = true, silent = true})

      keymap.set('n', '<Leader>fz', function()
        telescope.current_buffer_fuzzy_find({
          fuzzy = false,
          case_mode = "ignore_case",
          sorter = sorters.sort_by_position,
        })
      end, { desc = "Grep current buffer", noremap = true, silent = true })

    end,
  },
  {
    "danielfalk/smart-open.nvim",
    -- event = "VeryLazy",
    event = { "BufRead", "BufNewFile" },
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")

      vim.keymap.set("n", "<leader>fs", function ()
        require("telescope").extensions.smart_open.smart_open()
      end, {desc = "Open file", noremap = true, silent = true })
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
    -- event = "VeryLazy",
    event = { "BufRead", "BufNewFile" },
    config = function ()
      require("telescope").load_extension "file_browser"

      vim.keymap.set("n", "<space>fe", function()
	      require("telescope").extensions.file_browser.file_browser()
      end, {desc = "Open Explorer", noremap = true, silent = true })
    end,
  },
}
