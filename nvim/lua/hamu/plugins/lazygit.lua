return {
  "kdheepak/lazygit.nvim",
  event = { "BufRead", "BufNewFile" },
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

  config = function()
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', 'lg', '<CMD>LazyGit<CR>', {desc = "Open LazyGit"}, opts)
    vim.keymap.set('n', '<Leader>gl', '<CMD>LazyGit<CR>', {desc = "Open LazyGit"}, opts)
  end
}
