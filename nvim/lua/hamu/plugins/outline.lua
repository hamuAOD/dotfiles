return
{
  "hedyhli/outline.nvim",
  event = { "BufRead", "BufNewFile" },
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

    require("outline").setup {
      symbol_folding = {
        autofold_depth = false,
      }
    }
  end,
}
