return
{
  "iamcco/markdown-preview.nvim",
  event = { "BufRead", "BufNewFile" },
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,

  config = function()
    local keymap = vim.keymap
    local NS = { noremap = true, silent = true }

    keymap.set('n', '<Leader>mo', '<Plug>MarkdownPreview',       {desc = "Markdown Preview Start" },  NS)
    keymap.set('n', '<Leader>mc', '<Plug>MarkdownPreviewStop',   {desc = "Markdown Preview Stop" },   NS)
    keymap.set('n', '<Leader>mt', '<Plug>MarkdownPreviewToggle', {desc = "Markdown Preview Toggle" }, NS)
  end,
}
