return {
	"stevearc/conform.nvim",
	opts = {},
	event = { "BufRead", "BufNewFile" },

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "lua_ls", "stylua" },
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
-- brew install stylua prettier clang-format shfmt swift-format
-- pip install vsg
