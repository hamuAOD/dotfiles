local version = vim.version()
local version_text = ("v%d.%d.%d"):format(
  version.major,
  version.minor,
  version.patch
)

local function fmt_logo(left, right, padding)
  return {
    text = {
      { left,  hl = "DashboardLogoBlue" },
      { right, hl = "DashboardLogoCyan" },
    },
    align = "center",
    padding = padding,
  }
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config

  keys = {
    { "<Leader><Leader>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>:", function() Snacks.picker.commands() end, desc = "Picker Commands" },
    -- Find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>fC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    {
      "<leader>ff",
      function()
        Snacks.picker.files({ cwd = vim.fn.expand("~"), hidden = true, ignored = true })
      end,
      desc = "Find Files",
    },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>fh", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>fi", function() Snacks.picker.icons() end, desc = "Icons" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>fl", function() Snacks.picker.lines() end, desc = "Grep Current Buffer Line" },
    { "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
    { "<leader>fR", function() Snacks.picker.registers() end, desc = "Registers" },
    { "<leader>fs", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>fu", function() Snacks.picker.undo() end, desc = "Undo History" },
    -- Git
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff" },
    { "<leader>gf", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    -- Other
    { "<C-d>", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<c-\\>", function() Snacks.terminal() end, desc = "Toggle Terminal", mode = { "n", "t" } },
    { "<leader>tz", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
  },

  opts = {
    scroll = { enabled = true },
    bigfile = { enabled = true }, -- 巨大・圧縮済みファイルでTreesitterやLSPが固まるのを防ぐ
    quickfile = { enabled = true }, -- nvim ファイル名で直接起動したとき、先にファイルを表示する
    terminal = {
      win = {
        position = "float",
        border = "rounded",
        width = 0.9,
        height = 0.9,
        title_pos = "center",
      },
    },

    dashboard = {
      enabled = true,

      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲  ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = "󰣪  ", key = "m", desc = "Mason", action = ":Mason" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        fmt_logo("│ ", "╲ ││"),
        fmt_logo("││", "╲╲││"),
        fmt_logo("││", " ╲ │", 1),

        {
          text = {
            { "NVIM ", hl = "DashboardLogoCyan" },
            { version_text, hl = "DiagnosticOk" },
          },
          align = "center",
          -- padding = 1,
        },
        {
          text = {
            { string.rep("─", 64), hl = "Comment" },
          },
          align = "center",
          -- padding = 1,
        },
        {
          text = {
            { "Nvim is open source and freely distributable", hl = "Normal" },
          },
          align = "center",
        },
        {
          text = {
            { "https://neovim.io/#chat", hl = "DashboardLogoCyan" },
          },
          align = "center",
          -- padding = 1,
        },
        {
          text = {
            { string.rep("─", 64), hl = "Comment" },
          },
          align = "center",
          padding = 1,
        },

        { section = "keys", gap = 1, padding = 1 },
        {
          icon = " ",
          title = "Recent Files",
          padding = 1,
        },
        {
          section = "recent_files",
          limit = 5,
          indent = 2,
          padding = 1,
        },
        { section = "startup" },
      },
    },
    picker = { enabled = true },
  },

  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        Snacks.util.set_hl({
          SnacksPickerDir = "Normal",

          SnacksDashboardDir = "Comment",
          SnacksDashboardFile = "Special",
          SnacksDashboardTitle = "SnacksDashboardDesc",
        })
      end,
    })

    vim.api.nvim_set_hl(0, "DashboardLogoBlue", {
      fg = "#88e9fd",
    })
    vim.api.nvim_set_hl(0, "DashboardLogoCyan", {
      fg = "#50fa7b",
    })
  end,
}
