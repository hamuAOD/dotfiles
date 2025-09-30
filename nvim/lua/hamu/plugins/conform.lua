return {
  "stevearc/conform.nvim",
  opts = {},
  event = { "BufRead", "BufNewFile" },

  config = function()
    require("conform").setup({
      formatters_by_ft = {
        -- lua = { "stylua" },
        lua = { "lua_ls" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "yamlfmt", "prettier", "yamlfix" },
        vhdl = { "vsg" },
      },

      vim.keymap.set("n", "<leader>v", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, { desc = "Format file" }),
    })
  end,
}
-- for Mac
-- brew install stylua prettier clang-format
