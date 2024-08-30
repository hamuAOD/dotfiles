return {
  -- FZF 2024.08.27
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
      -- calling `setup` is optional for customization
      require"fzf-lua".setup({"fzf-native",winopts={preview={default="bat"}}})

      -- set keymaps
      local keymap = vim.keymap -- for conciseness
      local NS = { noremap = true, silent = true }

      keymap.set('n', '<leader>ff', "<cmd>lua require('fzf-lua').files()<CR>", {desc = "Find files"}, NS)
      keymap.set('n', '<leader>fl', "<cmd>lua require('fzf-lua').live_grep()<CR>", {desc = "Live Grep"}, NS)
      keymap.set('n', '<leader>fr', "<cmd>lua require('fzf-lua').oldfiles()<CR>", {desc = "Recent Files"}, NS)
      keymap.set('n', '<leader>fb', "<cmd>lua require('fzf-lua').buffers()<CR>", {desc = "Buffers"}, NS)
      keymap.set('n', '<leader>fr', "<cmd>lua require('fzf-lua').registers()<CR>", {desc = "Registers"}, NS)
    end,
  },
  -- vim-easy-align 2024.08.27
  {
    'junegunn/vim-easy-align',
    event = { "BufRead", "BufNewFile" },

    config = function()
      local keymap = vim.keymap
      local NS = { noremap = true, silent = true }

      keymap.set('n', '<Leader>ae', '<Plug>(EasyAlign)', {desc = "Easy-Align"}, NS)
      keymap.set('x', '<Leader>ae', '<Plug>(EasyAlign)', {desc = "Easy-Align"}, NS)
    end,
  },
  -- sidebar 2024.08.28
  {
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
  },
  -- hop 2024.08.29
  {
    -- 'phaazon/hop.nvim',
    'smoka7/hop.nvim',
    event = { "BufRead", "BufNewFile" },
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }

      local NS = { noremap = true, silent = true }
      vim.keymap.set("n", "<Leader>hl", "<CMD>HopLineStart<CR>", {desc = "Hop to Line Start"}, NS)
      vim.keymap.set("n", "<Leader>hw", "<CMD>HopWord<CR>",      {desc = "Hop to Word"}, NS)
      vim.keymap.set("n", "<Leader>hp", "<CMD>HopPattern<CR>",   {desc = "Hop to Char-Pattern"}, NS)
    end
  },
  -- align 2024.08.30
  {
    'Vonr/align.nvim',
    event = { "BufRead", "BufNewFile" },
    branch = "v2",
    lazy = true,
    init = function()
      -- Create your mappings here
      local NS = { noremap = true, silent = true }
      ---- Aligns to 1 character
      vim.keymap.set('x', '<Leader>aa',
        function()
          require'align'.align_to_char({
            length = 1,
          })
        end,
        { desc = "Aligns to 1 character" },
        NS
      )
      ---- Aligns to 2 character
      vim.keymap.set('x', '<Leader>ad',
        function()
          require'align'.align_to_char({
            preview = true,
            length = 2,
          })
        end,
        { desc = "Aligns to 2 character" },
        NS
      )
      -- Aligns to a string with previews
      vim.keymap.set('x', '<Leader>aw',
        function()
          require'align'.align_to_string({
            preview = true,
            regex = false,
          })
        end,
        { desc = "Aligns to a string with previews" },
        NS
      )
      -- Aligns to a Vim regex with previews
      vim.keymap.set('x', '<Leader>ar',
        function()
          require'align'.align_to_string({
            preview = true,
            regex = true,
          })
        end,
        { desc = "Aligns to a Vim regex with previews" },
        NS
      )
    end,
  },
  -- vim-illuminate 2024.08.30
  {
    "RRethy/vim-illuminate",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require('illuminate').configure({
        providers = {
          'lsp',
          'treesitter',
          'regex',
        },
        delay = 100,
        filetype_overrides = {},
        filetypes_denylist = {
          'dirbuf',
          'dirvish',
          'fugitive',
          'nvim-tree',
        },
        -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
        -- You must set filetypes_denylist = {} to override the defaults to allow filetypes_allowlist to take effect
        filetypes_allowlist = {},
        -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
        -- See `:help mode()` for possible values
        modes_denylist = {},
        -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
        -- See `:help mode()` for possible values
        modes_allowlist = {},
        -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_denylist = {},
        -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_allowlist = {},
        -- under_cursor: whether or not to illuminate under the cursor
        under_cursor = true,
        -- large_file_cutoff: number of lines at which to use large_file_config
        -- The `under_cursor` option is disabled when this cutoff is hit
        large_file_cutoff = nil,
        -- large_file_config: config to use for large files (based on large_file_cutoff).
        -- Supports the same keys passed to .configure
        -- If nil, vim-illuminate will be disabled for large files.
        large_file_overrides = nil,
        -- min_count_to_highlight: minimum number of matches required to perform highlighting
        min_count_to_highlight = 1,
        -- should_enable: a callback that overrides all other settings to
        -- enable/disable illumination. This will be called a lot so don't do
        -- anything expensive in it.
        should_enable = function(bufnr) return true end,
        -- case_insensitive_regex: sets regex case sensitivity
        case_insensitive_regex = false,
      })
    end,
  },
  -- commnet 2024.08.30 => Default from ver0.1
  {
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
}

