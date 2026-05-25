return {
  'nvim-treesitter/nvim-treesitter',
  event = "BufReadPost",
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
      }, -- List of parsers to ignore installing (or "all")
      sync_install = false,
      auto_install = true,
      ignore_install = {},

      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }
  end
}
