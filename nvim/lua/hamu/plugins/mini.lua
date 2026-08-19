return {
  "echasnovski/mini.nvim",
  version = false,
  event = { "BufReadPost", "BufNewFile", "InsertEnter" },
  config = function()
    require("mini.ai").setup()

    require("mini.align").setup({
      mappings = {
        start = "ga",
        start_with_preview = "gA",
      },
    })

    -- require('mini.completion').setup()

    require("mini.cursorword").setup()
    vim.cmd([[highlight MiniCursorword guibg=darkcyan guifg=lightgray]])

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "csv", "tsv" },
      callback = function()
        vim.b.minicursorword_disable = true
      end,
    })

    vim.api.nvim_create_user_command("CursorwordToggle", function()
      vim.b.minicursorword_disable = not vim.b.minicursorword_disable
    end, {})

    require("mini.surround").setup({
      mappings = {
        add = "sa",             -- Add surrounding in Normal and Visual modes
        delete = "sd",          -- Delete surrounding
        find = "sf",            -- Find surrounding (to the right)
        find_left = "sF",       -- Find surrounding (to the left)
        highlight = "sh",       -- Highlight surrounding
        replace = "sr",         -- Replace surrounding
        update_n_lines = "sn",  -- Update `n_lines`

        suffix_last = "l",      -- Suffix to search with "prev" method
        suffix_next = "n",      -- Suffix to search with "next" method
      },
    })

    require('mini.bracketed').setup({
      buffer     = { suffix = "" },
      comment    = { suffix = "" },
      -- buffer     = { suffix = 'b', options = {} },
      -- comment    = { suffix = 'c', options = {} },
      -- conflict   = { suffix = 'x', options = {} },
      -- diagnostic = { suffix = 'd', options = {} },
      -- file       = { suffix = 'f', options = {} },
      -- indent     = { suffix = 'i', options = {} },
      -- jump       = { suffix = 'j', options = {} },
      -- location   = { suffix = 'l', options = {} },
      -- oldfile    = { suffix = 'o', options = {} },
      -- quickfix   = { suffix = 'q', options = {} },
      -- treesitter = { suffix = 't', options = {} },
      -- undo       = { suffix = 'u', options = {} },
      -- window     = { suffix = 'w', options = {} },
      -- yank       = { suffix = 'y', options = {} },
    })
  end,

  keys = {
    { "<leader>tC", "<cmd>CursorwordToggle<cr>", desc = "Toggle Curosrword Highlight" },
  },
}
