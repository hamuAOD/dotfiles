return {
  'nvim-treesitter/nvim-treesitter',
  event = "VeryLazy",
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        "bash",
        "c",
        "css",
        "diff",
        "dockerfile",
        "git_config",
        "gitignore",
        "go",
        "html",
        "ini",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "rust",
        "swift",
        "toml",
        "typescript",
        "vim",
        "yaml"
      },
      highlight = {
        enable = true,
      },
    }
  end
}
