return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  event = "VeryLazy",

  config = function()
    local servers = {
      "clangd",
      "lua_ls",
      "gopls",
      "pylsp",
      "rust_analyzer",
      "vimls",
      "vls",
    }

    require("mason").setup({
      ui = {
        icons = {
          package_pending = " ",
          package_installed = "󰄳 ",
          package_uninstalled = " 󰚌",
        },
      }
    })

    require("mason-lspconfig").setup ({
      ensure_installed = servers,
    })

    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    local on_attach = function(_, bufnr)
      vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr(#{timeout_ms:250})")
      -- _G.lsp_onattach_func(i, bufnr)
    end

    local settings_for = {
      lua_ls = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        }
      },
      omniSharp = {
        omniSharp = {
          useGlobalMono = "always"
        }
      }
    }

    for _, server in ipairs(servers) do
      local opts = {
        on_attach = on_attach,
      }

      if settings_for[server] then
        opts.settings = settings_for[server]
      end

      lspconfig[server].setup(opts)
    end

    vim.cmd("LspStart") -- 初回起動時はBufEnterが発火しない
  end,
}
