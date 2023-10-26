--M.mappings = require "core.mapping"
require("hamu.core.options")
-- require("hamu.core.autocmds")
require("hamu.core.keymaps")

---- disable netrw at the very start of your init.lua
vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)
