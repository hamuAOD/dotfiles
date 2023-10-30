return{
  'sidebar-nvim/sidebar.nvim',
  event = { "BufRead", "BufNewFile" },
  lazy = false,

  config = function ()
    require("sidebar-nvim").setup({
      side = "right",
      sections = { "datetime", "git", "symbols", "diagnostics" },
      symbols = {
        icon = "󰊕",
      },
    })

    local NS = { noremap = true, silent = true }
    vim.keymap.set('n', '<Leader>ts', '<CMD>SidebarNvimToggle<CR>', {desc = "Toggle Sidebar"}, NS)
  end,
}
