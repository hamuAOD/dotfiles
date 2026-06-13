return {

  "mason-org/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "b0o/schemastore.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog", "MasonUpdate" },

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
      "verible",
      "vimls",
      "yamlls",
      "zk",
    }

    if vim.fn.has("win32") == 1 then
      local win_exclude = { gopls = true, jsonnet_ls = true, zk = true, textlsp = true }
      servers = vim.tbl_filter(function(s) return not win_exclude[s] end, servers)
    end

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

    vim.lsp.config("jsonls", {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    vim.lsp.config("yamlls", {
      settings = {
        yaml = {
          schemaStore = {
            enable = false,
            url = "",
          },
          schemas = require("schemastore").yaml.schemas(),
        },
      },
    })

    vim.lsp.enable(servers)
  end,
}
