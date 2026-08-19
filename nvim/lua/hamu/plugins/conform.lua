return {
  "stevearc/conform.nvim",
  opts = {},
  event = { "BufRead", "BufNewFile" },

  config = function()
    local conform = require("conform")
    local formatters_dir = vim.fs.joinpath(vim.fn.stdpath("config"), "formatters")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        markdown = { "prettier" },
        swift = { "swift-format" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        go = { "gopls" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        toml = { "taplo" },
        yaml = { "yamlfmt", "prettier", "yamlfix" },
        vhdl = { "vsg" },
      },
      formatters = {
        stylua = {
          prepend_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--column-width",
            "120",
            "--quote-style",
            "AutoPreferDouble",
          },
        },

        shfmt = {
          prepend_args = {
            "-i",
            "2",
            "-ci",
          },
        },

        prettier = {
          prepend_args = {
            "--print-width",
            "120",
            "--tab-width",
            "2",
            "--no-use-tabs",
            "--prose-wrap",
            "preserve",
            "--end-of-line",
            "lf",
          },
        },

        taplo = {
          args = {
            "format",
            "--option",
            "column_width=120",
            "--option",
            "indent_string=  ",
            "--stdin-filepath",
            "$FILENAME",
            "-",
          },
        },
      },
    })

    vim.keymap.set({ "n", "x" }, "<Leader>v", function()
      require("conform").format({ async = true, lsp_format = "fallback" })
    end, { desc = "Format file" })
  end,
}
-- for Mac
-- brew install stylua prettier clang-format shfmt swift-format taplo
-- pip install vsg
