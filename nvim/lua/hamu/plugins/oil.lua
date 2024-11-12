return
{
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",

    config = function()
      require("oil").setup({
        default_file_explorer = true,
        delete_to_trash = true,
        -- skip_confirm_for_simple_edits = false,
        columns = {
          "icon",
          "permissions",
          "size",
          "mtime",
        },
        view_options = {
          show_hidden = true,
          natural_order = true,
        },
        win_options = {
          signcolumn = "yes:2",
        },
      })

      local NS = { noremap = true, silent = true }
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', {desc = "Oil"}, NS)

    end,
  },
  {
    "refractalize/oil-git-status.nvim",
    dependencies = { "stevearc/oil.nvim" },
    event = "VeryLazy",
    config = true,
  },
}
