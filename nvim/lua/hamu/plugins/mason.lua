return {
  "williamboman/mason.nvim", -- LSP Installer
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  config = function()
    require "mason".setup {}
    local mason_lspconfig = require("mason-lspconfig")
    local on_attach = function(_, bufnr)
          vim.api.nvim_buf_set_option(bufnr, "formatexpr",
          "v:lua.vim.lsp.formatexpr(#{timeout_ms:250})")
          -- _G.lsp_onattach_func(i, bufnr)
    ui = {
      icons = {
        package_pending = " ",
        package_installed = "󰄳 ",
        package_uninstalled = " 󰚌",
      },
    }
  end,
  mason_lspconfig.setup({
    ensure_installed = {
      "clangd",
      "lua_ls",
      "pylsp",
      "rust_analyzer",
      "vimls"
    },
  }),
  mason_lspconfig.setup_handlers({
    function(server_name)
    local opts = {
      on_attach = on_attach,
      settings = {
        ["omniSharp"] = {
          useGlobalMono = "always"
        }
      },
    }
    require("lspconfig")[server_name].setup(opts)
    end,
  })
  vim.cmd("LspStart") -- 初回起動時はBufEnterが発火しない
  end,
}
