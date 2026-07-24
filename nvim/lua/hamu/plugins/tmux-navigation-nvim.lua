return
{
  'alexghergh/nvim-tmux-navigation',
  keys = {
    { '<C-h>', '<Cmd>NvimTmuxNavigateLeft<CR>', desc = 'Navigate left' },
    { '<C-j>', '<Cmd>NvimTmuxNavigateDown<CR>', desc = 'Navigate down' },
    { '<C-k>', '<Cmd>NvimTmuxNavigateUp<CR>', desc = 'Navigate up' },
    { '<C-l>', '<Cmd>NvimTmuxNavigateRight<CR>', desc = 'Navigate right' },
    { '<C-\\>', '<Cmd>NvimTmuxNavigateLastActive<CR>', desc = 'Navigate to last active pane' },
  },

  config = function()
    local nvim_tmux_nav = require('nvim-tmux-navigation')

    nvim_tmux_nav.setup {
        disable_when_zoomed = true -- defaults to false
    }
  end
}
