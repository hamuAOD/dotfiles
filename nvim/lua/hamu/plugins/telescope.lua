return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = { "Telescope" }, -- ":Telescope"実行後にdependenciesが読み込まれる
    keys = {
      { '<Leader>b', function() require('telescope.builtin').buffers() end, desc = "Buffers" },
      { '<Leader>fb', function() require('telescope.builtin').buffers() end, desc = "Buffers" },
      { '<Leader>r', function() require('telescope.builtin').registers() end, desc = "Registers" },
      { '<Leader>fr', function() require('telescope.builtin').registers() end, desc = "Registers" },
      { '<Leader>fc', function() require('telescope.builtin').command_history() end, desc = "Command History" },
      { '<Leader>ff', function() require('telescope.builtin').find_files() end, desc = "Find Files" },
      { '<Leader>ff', function() require("telescope.builtin").find_files({
          cwd = vim.fn.expand("~"),
          hidden = true,
          find_command = {
            "rg",
            "--files",
            "--color", "never",
            "--glob", "!Library/**",
            "--glob", "!.cache/**",
            "--glob", "!.local/**",
            "--glob", "!.rustup/**",
          },
        })
      end, desc = "Find Files" },
      { '<Leader>fg', function() require('telescope.builtin').live_grep() end, desc = "Live Grep" },
      { '<Leader>fo', function() require('telescope.builtin').oldfiles() end, desc = "Old Files" },
      { '<Leader>fk', function() require('telescope.builtin').keymaps() end, desc = "keymaps" },
      {
        '<Leader>fz',
        function()
          require('telescope.builtin').current_buffer_fuzzy_find({
            fuzzy = false,
            case_mode = "ignore_case",
            sorter = require('telescope.sorters').sort_by_position,
          })
        end,
        desc = "Grep current buffer",
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    -- event = "VeryLazy",

    config = function()
      require('telescope').setup({
        defaults = {
          preview = {
            treesitter = false,
          },
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
      pcall(require("telescope").load_extension, "noice")
    end,
  },
  {
    "danielfalk/smart-open.nvim",
    -- event = "VeryLazy",
    event = { "BufRead", "BufNewFile" },
    keys = {
      {
        "<leader>fs",
        function()
          require("telescope").extensions.smart_open.smart_open()
        end,
        desc = "Open file",
      },
    },
    branch = "0.2.x",
    config = function()
      if vim.fn.has("win32") == 1 then
        vim.g.sqlite_clib_path = "C:/Program Files/Neovim/bin/sqlite3.dll"
      end
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
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
    keys = {
      {
        "<space>fe",
        function()
          require("telescope").extensions.file_browser.file_browser()
        end,
        desc = "Open Explorer",
      },
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function ()
      require("telescope").load_extension "file_browser"
    end,
  },
}
