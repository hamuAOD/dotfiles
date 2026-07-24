return
{
  'akinsho/toggleterm.nvim',
  version = "*",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup{
      size = 100,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
      direction = 'float',
      float_opts = {
        -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        border = 'single',
        -- width = <value>,
        -- height = <value>,
        -- row = <value>,
        -- col = <value>,
        -- winblend = 3,
        -- zindex = <value>,
        -- title_pos = 'left' | 'center' | 'right', position of the title of the floating window
        title_pos = 'center',
      },
      close_on_exit = true,
    }
  end
}
