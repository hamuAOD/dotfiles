return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        priority = 0,
        enable = true,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "┌",
          left_bottom = "└",
          right_arrow = ">",
        },
        style = "#00ffff",
        use_treesitter = true,
      },
      indent = {
        enable = true,
        chars = {
            "│",
        },
        style = {
            "#44475A",
            -- vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
        },
        -- style = {
        --   "#FF79C6",
        --   "#FF7F00",
        --   "#F1FA8C",
        --   "#50FA7B",
        --   "#BD93F9",
        --   "#8BE9FD",
        --   "#FF5555",
        -- },
      },
      blank = {
        enable = false,
        chars = {
          " ",
        },
        style = {
          { bg = "#434437" },
          { bg = "#2f4440" },
          { bg = "#433054" },
          { bg = "#284251" },
        },
      },
      line_num = {
        enable = false,
        style = "#806d9c",
      },
    })
    -- vim.keymap.set('n', '<Leader>ce', '<CMD>EnableHLChunk<CR>', {desc = "Enable hlchunk"}, { noremap = true, silent = true })
    -- vim.keymap.set('n', '<Leader>cd', '<CMD>DisableHLChunk<CR>', {desc = "Disable hlchunk"}, { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>he', '<CMD>EnableHLChunk<CR><CMD>EnableHLIndent<CR>', {desc = "Enable hlchunk"}, { noremap = true, silent = true })
    vim.keymap.set('n', '<Leader>hd', '<CMD>DisableHLChunk<CR><CMD>DisableHLIndent<CR>', {desc = "Disable hlchunk"}, { noremap = true, silent = true })
  end
}
