return{
  'sidebar-nvim/sidebar.nvim',
  event = { "BufRead", "BufNewFile" },
  lazy = false,

  config = function ()
    require("sidebar-nvim").setup({
      side = "right",
      datetime = {
        icon = "",
        format = "%a %b %d, %H:%M",
        clocks = {
            { name = "local" }
        }
      },
      buffers = {
        icon = "",
        ignored_buffers = {},     -- ignore buffers by regex
        sorting = "id",           -- alternatively set it to "name" to sort by buffer name instead of buf id
        show_numbers = true,      -- whether to also show the buffer numbers
        ignore_not_loaded = true, -- whether to ignore not loaded buffers
        ignore_terminal = true,   -- whether to show terminal buffers in the list
      },
      sections = { "datetime", "buffers", "git", "symbols", "diagnostics" },
    })

    local NS = { noremap = true, silent = true }
    vim.keymap.set('n', '<Leader>tb', '<CMD>SidebarNvimToggle<CR>', {desc = "Toggle Sidebar"}, NS)
  end,
}
