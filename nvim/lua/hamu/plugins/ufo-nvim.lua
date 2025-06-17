return {
  "kevinhwang91/nvim-ufo",
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    "kevinhwang91/promise-async", -- 必須依存
  },
  config = function()
    require("ufo").setup({
      provider_selector = function()
        return { "lsp", "indent" }
      end,
      close_fold_kinds = {} -- 自動閉じを抑制
    })

    -- 全て折りたたむ
    vim.keymap.set("n", "<Leader>zC", require("ufo").closeAllFolds, {desc = "closeAllFolds", noremap = true, silent = true })
    -- 全て展開
    vim.keymap.set("n", "<Leader>zO", require("ufo").openAllFolds, {desc = "openAllFolds", noremap = true, silent = true })
    -- 現在のフォールドを閉じる
    vim.keymap.set("n", "<Leader>zc", require("ufo").closeFoldsWith, {desc = "closeFoldsWith", noremap = true, silent = true })
    -- 現在のフォールドを開く
    vim.keymap.set("n", "<Leader>zo", require("ufo").openFoldsExceptKinds, {desc = "openFoldsExceptKinds", noremap = true, silent = true })
    -- フォールド内のプレビュー
    vim.keymap.set("n", "<Leader>zk", function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover() -- 通常のKにfallback
      end
      end, {desc = "PreviewFolds", noremap = true, silent = true })
  end,
}
