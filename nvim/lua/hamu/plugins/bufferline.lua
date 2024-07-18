return {
  'akinsho/bufferline.nvim',
  event = { "BufRead", "BufNewFile" },
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function ()
    require("bufferline").setup{}
  end,
}
