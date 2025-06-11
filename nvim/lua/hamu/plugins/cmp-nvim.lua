return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    'windwp/nvim-autopairs',
    'FelipeLema/cmp-async-path',
    'hrsh7th/cmp-buffer',
    -- 'hrsh7th/cmp-calc',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'saadparwaiz1/cmp_luasnip',
    -- {
    --   'rafamadriz/friendly-snippets',
    --   config = function()
    --     require('luasnip.loaders.from_vscode').lazy_load()
    --   end,
    -- },
    -- {
    --   'L3MON4D3/LuaSnip',
    --   build = 'make install_jsregexp',
    --   version = 'v2.*',
    --   config = true,
    --   keys = {
    --     {
    --       '<tab>',
    --       function()
    --         return require('luasnip').jumpable(1) and '<Plug>luasnip-jump-next' or '<tab>'
    --       end,
    --       expr = true,
    --       silent = true,
    --       mode = 'i',
    --     },
    --     {
    --       '<tab>',
    --       function()
    --         return require('luasnip').jump(1)
    --       end,
    --       mode = { 'i', 's' },
    --     },
    --     {
    --       '<S-tab>',
    --       function()
    --         return require('luasnip').jump(-1)
    --       end,
    --       mode = { 'i', 's' },
    --     },
    --   },
    -- },
  },
  event = 'InsertEnter',
  opts = function()
    vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
    local cmp = require('cmp')
    local defaults = require('cmp.config.default')()
    return {
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<S-CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'cmdline' },
        { name = 'async_path' },
        { name = 'calc' },
        { name = 'git' },
        { name = 'nvim_lsp_signature_help' },
      }),
      formatting = {
        format = function(_, item)
          local icons = {
            Array = ' ',
            Boolean = ' ',
            Class = ' ',
            Color = ' ',
            Constant = ' ',
            Constructor = ' ',
            Copilot = ' ',
            Enum = ' ',
            EnumMember = ' ',
            Event = ' ',
            Field = ' ',
            File = ' ',
            Folder = ' ',
            Function = ' ',
            Interface = ' ',
            Key = ' ',
            Keyword = ' ',
            Method = ' ',
            Module = ' ',
            Namespace = ' ',
            Null = ' ',
            Number = ' ',
            Object = ' ',
            Operator = ' ',
            Package = ' ',
            Property = ' ',
            Reference = ' ',
            Snippet = ' ',
            String = ' ',
            Struct = ' ',
            Text = ' ',
            TypeParameter = ' ',
            Unit = ' ',
            Value = ' ',
            Variable = ' ',
          }
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
        return item
        end,
      },
      experimental = { ghost_text = { hl_group = 'CmpGhostText' } },
      sorting = defaults.sorting,
      window = { completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered() },
    }
  end,
  config = function(_, opts)
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    -- nvim-autopairs integration
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
    cmp.setup(opts)

    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })

  end,
  -----@param opts cmp.ConfigSchema
  --opts = function(_, opts)
  --  local cmp = require("cmp")
  --  opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
  --end,
}
