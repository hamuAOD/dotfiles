return
{
  "hedyhli/outline.nvim",
  event = { "BufRead", "BufNewFile" },
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

    require("outline").setup {
      provider_selector = function(bufnr, filetype, buftype)
        if filetype == 'swift' then
          return {'lsp', 'treesitter'}
        end
        return {'lsp', 'treesitter'}
      end,
      symbol_folding = {
        autofold_depth = false,
      }
    }
  end,
}
