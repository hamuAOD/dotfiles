return{
  'cohama/lexima.vim',
  -- 'hrsh7th/nvim-insx', -- deleted by ERROR
  event = { "BufRead", "BufNewFile" },
  config = function()
    vim.cmd([[call lexima#add_rule({'char': '<', 'input_after': '>'})]])
  end
}
