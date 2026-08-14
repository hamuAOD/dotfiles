return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    scroll = { enabled = true },
    terminal = {
      win = {
        position = "float",
        border = "rounded",
        width = 0.9,
        height = 0.9,
        title_pos = "center",
      },
    },
    bigfile = { enabled = true }, -- 巨大・圧縮済みファイルでTreesitterやLSPが固まるのを防ぐ
    quickfile = { enabled = true }, -- nvim ファイル名で直接起動したとき、先にファイルを表示する
    dashboard = { enabled = false },
    picker = { enabled = false }
  },
  keys = {
    -- Find
    { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers", },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers", },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep", },
    { "<leader>fh", function() Snacks.picker.command_history() end, desc = "Command History", },
    { "<leader>fo", function() Snacks.picker.recent() end, desc = "Old Files", },
    { "<leader>fr", function() Snacks.picker.registers() end, desc = "Registers", },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps", },
    { "<leader>fl", function() Snacks.picker.lines() end, desc = "Grep Current Buffer Line", },
    { "<leader>fB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers", },
    { "<leader>fs", function() Snacks.picker.smart() end, desc = "Smart Find Files", },
    { "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks", },
    { "<leader>fc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    { "<leader>:", function() Snacks.picker.commands() end, desc = "Picker Commands" },
    {
      "<leader>ff",
      function()
        Snacks.picker.files({
          cwd = vim.fn.expand("~"),
          hidden = true,
          ignored = true,
        })
      end,
      desc = "Find Files",
    },
    -- Git
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit", },
    { "<leader>gf", function() Snacks.picker.git_files() end, desc = "Find Git Files", },
    -- Other
    { "<leader>tz", function() Snacks.zen() end, desc = "Toggle Zen Mode", },
    { "<c-\\>", function() Snacks.terminal() end, desc = "Toggle Terminal", mode = { "n", "t" },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        Snacks.util.set_hl({
          SnacksPickerDir = "Normal",
        })
      end,
    })
  end,
}
