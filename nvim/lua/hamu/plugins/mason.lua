return {
  "williamboman/mason.nvim", -- LSP Installer
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_pending = " ",
          package_installed = "󰄳 ",
          package_uninstalled = " 󰚌",
        },
      }
    })
    require("mason-lspconfig").setup {
      ensure_installed = {
        "clangd",
        "lua_ls",
        "pylsp",
        "rust_analyzer",
        "vimls",
        "vls",
      }
    }
  end,
}
