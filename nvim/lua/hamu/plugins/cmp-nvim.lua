return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    'windwp/nvim-autopairs',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
  },
  event = { "InsertEnter", "CmdlineEnter"},

  config = function()
    local cmp = require('cmp')
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- Insert モード補完
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"]   = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"]   = cmp.mapping.scroll_docs(-4),
        ["<C-f>"]   = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"]   = cmp.mapping.abort(),
        ["<CR>"]    = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer", keyword_length = 1, max_item_count = 10 },
        { name = "path" },
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      experimental = { ghost_text = true },
    })

    -- autopairs 連携
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- `/` (検索) 補完
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {{
        name = "buffer",
        keyword_length = 1,
        max_item_count = 10,
      }},
    })

    -- `:` (コマンド) 補完
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = { ignore_cmds = { "Man", "!" } },
          keyword_length = 2,
          max_item_count = 15,
        },
      }),
    })
  end,
}
