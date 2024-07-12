return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" }
  }
}
-- gitui.lua
-- return {
--   'is0n/fm-nvim',
--   event = { "BufRead", "BufNewFile" },
--   config = function()
--     local NS = { noremap = true, silent = true }
--
--     vim.keymap.set('n', '<Leader>gu', ':Gitui<CR>', {desc = "Open Gitui"}, NS)
--   end,
-- }
