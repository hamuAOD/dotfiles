return{
  'numToStr/Comment.nvim',
  event = { "BufRead", "BufNewFile" },
  opts = {
      -- add any options here
  },
  lazy = false,

  config = function ()
    require('Comment').setup()
  end,
}
