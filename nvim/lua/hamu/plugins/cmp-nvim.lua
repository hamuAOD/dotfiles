return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "L3MON4D3/LuaSnip", lazy = true },
    {"saadparwaiz1/cmp_luasnip", lazy = true },
    {"uga-rosa/cmp-dictionary", lazy = true },
    {'windwp/nvim-autopairs', lazy = true },
    {'hrsh7th/cmp-buffer', lazy = true },
    {'hrsh7th/cmp-path', lazy = true },
    {'hrsh7th/cmp-cmdline', lazy = true },
    {'hrsh7th/cmp-nvim-lsp', lazy = true },
  },
  event = { "InsertEnter", "CmdlineEnter"},

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    local default_matching = {
      disallow_partial_matching = false,
      disallow_prefix_unmatching = false,
      disallow_fullfuzzy_matching = false,
      disallow_symbol_nonprefix_matching = false,
      ignore_case = true,
    }

    local dict = {
      ["*"] = { "$HOME/.config/nvim/lua/hamu/dict/all.dict" },
      ft = {
        vhdl = { "$HOME/.config/nvim/lua/hamu/dict/vhdl.dict" },
      },
    }

    -- Lua スニペットを読み込む
    require("luasnip.loaders.from_lua").lazy_load({
      paths = vim.fn.stdpath("config") .. "/lua/hamu/snippets"
    })
    -- VSCode 形式のスニペットを読み込む
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { vim.fn.stdpath("config") .. "/lua/hamu/snippets" }
      -- paths = "$HOME/.config/nvim/lua/hamu/snippets"
    })
    -- cmp-dictionary
    require("cmp_dictionary").setup({
      paths = dict["*"],
      exact_length = 1,
      first_case_insensitive = true,
      -- document = {
      --   enable = true,
      --   command = { "wn", "${label}", "-over" },
      -- },
    })

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "*",
      callback = function(ev)
        local paths = dict.ft[vim.bo.filetype] or {}
        vim.list_extend(paths, dict["*"])
        require("cmp_dictionary").setup({
          paths = paths,
        })
      end
    })

    -- Insert モード補完
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged }
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"]   = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"]   = cmp.mapping.scroll_docs(-4),
        ["<C-f>"]   = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"]   = cmp.mapping.abort(),
        ["<CR>"]    = cmp.mapping.confirm({ select = true }),
        ["<C-s>"]   = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer", keyword_length = 1, max_item_count = 10, },
        { name = "path" },
        { name = "dictionary", keyword_length = 1, },
      }),
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      matching = default_matching,
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
      matching = default_matching
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
      matching = default_matching
    })
  end,
}
