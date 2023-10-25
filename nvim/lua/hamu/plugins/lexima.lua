return{
  'cohama/lexima.vim',
  event = { "BufRead", "BufNewFile" },
  config = function()
    vim.cmd([[call lexima#add_rule({'char': '<', 'input_after': '>'})]])
  end
}
