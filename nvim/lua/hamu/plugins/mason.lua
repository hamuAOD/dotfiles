return {
  "mason-org/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "b0o/schemastore.nvim",
  },
  event = "VeryLazy",

  config = function()
    local servers = {
      "clangd",
      "gopls",
      "jsonls",
      "jsonnet_ls",
      "lua_ls",
      "markdown_oxide",
      "marksman",
      "mesonlsp",
      "prosemd_lsp",
      "pylsp",
      "rust_analyzer",
      "textlsp",
      "vimls",
      "zk",
    }
    -- DAP / Linter / Formatter
    local tools = {
      "clang-format",
      "prettier",
      "shellcheck",
      "shfmt",
      "swiftlint",
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

    require("mason-tool-installer").setup({
      ensure_installed = tools,
      auto_update = false,
      run_on_start = true,
    })

    -- local lspconfig = require("lspconfig")
    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
    --
    -- local on_attach = function(_, bufnr)
    --   vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr(#{timeout_ms:250})")
    --   -- _G.lsp_onattach_func(i, bufnr)
    -- end
    --
    -- local settings_for = {
    --   lua_ls = {
    --     Lua = {
    --       diagnostics = { globals = { "vim" } },
    --     }
    --   },
    --   omniSharp = {
    --     omniSharp = {
    --       useGlobalMono = "always"
    --     }
    --   }
    -- }
    --
    -- for _, server in ipairs(servers) do
    --   local opts = {
    --     on_attach = on_attach,
    --     capabilities = capabilities,
    --   }
    --
    --   if settings_for[server] then
    --     opts.settings = settings_for[server]
    --   end
    --
    --   lspconfig[server].setup(opts)
    -- end
    --
    -- require("lspconfig").marksman.setup({})
    --
    -- require('lspconfig').jsonls.setup {
    --   settings = {
    --     json = {
    --       schemas = require('schemastore').json.schemas(),
    --       validate = { enable = true },
    --     },
    --   },
    -- }

    -- vim.cmd("LspStart") -- 初回起動時はBufEnterが発火しない

    vim.lsp.config("*", {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
    vim.lsp.enable(servers)
  end,
}
