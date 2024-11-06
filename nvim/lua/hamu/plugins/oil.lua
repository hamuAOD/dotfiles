return
{
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },

  event = "VeryLazy",

  config = function()
    require("oil").setup({
      default_file_explorer = false,
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
      }
    })

    local NS = { noremap = true, silent = true }
    vim.cmd([[let g:translate_copy_result = 1]])
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', {desc = "Oil"}, NS)

  end,
}
