return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufRead", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { enabled = false },
    -- highlight = { "Function", "Label" },
    -- highlight = "IblIndent",
    use_treesitter = true,
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },

  config = function()
    local highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    local hooks = require "ibl.hooks"

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      -- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      -- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      -- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      -- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      -- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      -- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      -- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })

      -- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#C24E57" })
      -- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#C7A25D" })
      -- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#4391D1" })
      -- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#B37C48" })
      -- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#7AA55B" })
      -- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#A85ABF" })
      -- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#3898A4" })

      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#3E3A53" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#5E5A73" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#3E3A53" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#3E3A53" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#3E3A53" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#3E3A53" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#3E3A53" })
    end)

    require("ibl").setup { indent = { highlight = highlight } }
    -- require("ibl").setup()
    --
    --:IBLToggle
    vim.keymap.set('n', '<Leader>ti', '<CMD>IBLToggle<CR>', {desc = "Toggle IndentLine"}, { noremap = true, silent = true })
  end,
}
