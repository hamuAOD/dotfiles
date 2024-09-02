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
  },
  -- nvim-surround 2024.08.30
  {
    "kylechui/nvim-surround",
    -- version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
    end
  },
  -- colorscheme
  {
    "Mofiqul/dracula.nvim",
    priority = 1000,
    config = function()
      vim.cmd[[colorscheme dracula]]
    end,
    -- 背景をTerminalに合わせる
    vim.cmd 'autocmd ColorScheme * highlight Normal ctermbg=none',
    vim.cmd 'autocmd ColorScheme * highlight LineNr ctermbg=none',
  },
  {
    -- "rebelot/kanagawa.nvim",
    "maxmx03/dracula.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function ()
      local dracula = require 'dracula'
      dracula.setup()
      vim.cmd.colorscheme 'dracula'
    end,
    -- 背景をTerminalに合わせる
    -- vim.cmd 'autocmd ColorScheme * highlight Normal ctermbg=none',
    -- vim.cmd 'autocmd ColorScheme * highlight LineNr ctermbg=none',
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function ()
      local dracula = require 'dracula'
      dracula.setup()
      vim.cmd.colorscheme 'dracula'
    end,
  },
  {
    "binhtran432k/dracula.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function ()
      local dracula = require 'dracula'
      dracula.setup()
      vim.cmd.colorscheme 'dracula'
    end,
  },
  -- oil 2024.09.03
  {
    'stevearc/oil.nvim',
    event = "VeryLazy",
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    --
    config = function()
      require("oil").setup({
        -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
        -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
        default_file_explorer = true,
        -- Id is automatically added at the beginning, and name at the end
        -- See :help oil-columns
        columns = {
          "icon",
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        -- Buffer-local options to use for oil buffers
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        -- Window-local options to use for oil buffers
        win_options = {
          wrap = true,
          signcolumn = "yes:2",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
        delete_to_trash = true,
        -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
        skip_confirm_for_simple_edits = true,
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        -- (:help prompt_save_on_select_new_entry)
        prompt_save_on_select_new_entry = true,
        -- Oil will automatically delete hidden buffers after this delay
        -- You can set the delay to false to disable cleanup entirely
        -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
        cleanup_delay_ms = 2000,
        lsp_file_methods = {
          -- Time to wait for LSP file operations to complete before skipping
          timeout_ms = 1000,
          -- Set to true to autosave buffers that are updated with LSP willRenameFiles
          -- Set to "unmodified" to only save unmodified buffers
          autosave_changes = false,
        },
        -- Constrain the cursor to the editable parts of the oil buffer
        -- Set to `false` to disable, or "name" to keep it on the file names
        constrain_cursor = "editable",
        -- Set to true to watch the filesystem for changes and reload oil
        watch_for_changes = false,
        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
        -- Additionally, if it is a string that matches "actions.<name>",
        -- it will use the mapping at require("oil.actions").<name>
        -- Set to `false` to remove a keymap
        -- See :help oil-actions for a list of all available actions
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
          ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
          ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = true,
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = false,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return false
          end,
          -- Sort file names in a more intuitive order for humans. Is less performant,
          -- so you may want to set to false if you work with large directories.
          natural_order = true,
          -- Sort file and directory names case insensitive
          case_insensitive = false,
          sort = {
            -- sort order can be "asc" or "desc"
            -- see :help oil-columns to see which columns are sortable
            { "type", "asc" },
            { "name", "asc" },
          },
        },
        -- Extra arguments to pass to SCP when moving/copying files over SSH
        extra_scp_args = {},
        -- EXPERIMENTAL support for performing file operations with git
        git = {
          -- Return true to automatically git add/mv/rm files
          add = function(path)
            return false
          end,
          mv = function(src_path, dest_path)
            return false
          end,
          rm = function(path)
            return false
          end,
        },
        -- Configuration for the floating window in oil.open_float
        float = {
          -- Padding around the floating window
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          -- preview_split: Split direction: "auto", "left", "right", "above", "below".
          preview_split = "auto",
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          override = function(conf)
            return conf
          end,
        },
        -- Configuration for the actions floating preview window
        preview = {
          -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_width and max_width can be a single value or a list of mixed integer/float types.
          -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
          max_width = 0.9,
          -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
          min_width = { 40, 0.4 },
          -- optionally define an integer/float for the exact width of the preview window
          width = nil,
          -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_height and max_height can be a single value or a list of mixed integer/float types.
          -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
          max_height = 0.9,
          -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
          min_height = { 5, 0.1 },
          -- optionally define an integer/float for the exact height of the preview window
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          -- Whether the preview window is automatically updated when the cursor is moved
          update_on_cursor_moved = true,
        },
        -- Configuration for the floating progress window
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
        -- Configuration for the floating SSH window
        ssh = {
          border = "rounded",
        },
        -- Configuration for the floating keymaps help window
        keymaps_help = {
          border = "rounded",
        },
      })

    local NS = { noremap = true, silent = true }
    vim.cmd([[let g:translate_copy_result = 1]])
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', {desc = "Oil"}, NS)

    end
  },
  {
    "refractalize/oil-git-status.nvim",
    dependencie = {
      "stevearc/oil.nvim",
    },

    config = function()
      require('oil-git-status').setup({
        show_ignored = true -- show files that match gitignore with !!
      })

      for _, hl_group in pairs(require("oil-git-status").highlight_groups) do
        if hl_group.index then
          vim.api.nvim_set_hl(0, hl_group.hl_group, { fg = "#ff0000" })
        else
          vim.api.nvim_set_hl(0, hl_group.hl_group, { fg = "#FFc47F" })
        end
      end
    end,
  },
}
