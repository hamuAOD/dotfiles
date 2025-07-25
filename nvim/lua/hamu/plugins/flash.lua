return {
  "folke/flash.nvim",
  event = { "BufRead", "BufNewFile" },
  ---@type Flash.Config
  opts = {
    modes = {
      char = {
        jump_labels = true
      },
      search = {
        enabled = false
      },
    },
  },
  -- stylua: ignore
  keys = {
    { ";", mode = { "n", "x", "o" }, function() require("flash").jump() end, {desc = "Flash",noremap = true} },
    -- { "<Leader>l", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- { "<Leader>L", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
