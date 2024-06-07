return {
  'Wansmer/treesj',
  event = { "BufRead", "BufNewFile" },
  -- keys = { '<space>m', '<space>j', '<space>s' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require('treesj').setup({
      use_default_keymaps = false
    })

    local keymap = vim.keymap
    local NS = { noremap = true, silent = true }
    keymap.set("n", "<Leader>tj", "<CMD>TSJToggle<CR>", {desc = "Toggle TreeSJ"}, NS)
    -- map("n", "<Leader>js", "<CMD>TSJSplit<CR>", {desc = "split node under cursor"}, NS)
    -- map("n", "<Leader>jj", "<CMD>TSJJoin<CR>", {desc = "join node under cursor"}, NS)
  end,
}
