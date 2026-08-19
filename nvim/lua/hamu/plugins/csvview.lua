return {
  "hat0uma/csvview.nvim",
  ---@module "csvview"
  ---@type CsvView.Options
  ft = { "csv", "tsv" },
  opts = {
    parser = { comments = { "#", "//" } },
    view = {
      display_mode = "border",
      header_lnum = 1,
      sticky_header = {
        enabled = true,
        separator = "─",  -- Separator line character
      },
    },

    keymaps = {
      -- Text objects for selecting fields
      textobject_field_inner = { "if", mode = { "o", "x" } },
      textobject_field_outer = { "af", mode = { "o", "x" } },
      -- Excel-like navigation:
      -- Use <Tab> and <S-Tab> to move horizontally between fields.
      -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
      -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
      jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
      jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
      jump_next_row = { "<Enter>", mode = { "n", "v" } },
      jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
    },
    autocmd = {
      enable = true,
    },
  },

  config = function(_, opts)
    require("csvview").setup(opts)

    vim.api.nvim_set_hl(0, "csvviewcol0", { link = "identifier" })
    vim.api.nvim_set_hl(0, "csvviewcol3", { link = "String" })
    vim.api.nvim_set_hl(0, "csvviewcol4", { link = "function" })

    vim.cmd("CsvViewEnable")
  end,

  cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },

  keys = {
    { "<leader>tv", "<cmd>CsvViewToggle<cr>", desc = "Toggle CSV View" },
  },
}
