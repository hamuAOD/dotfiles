-- JSON formatter : brew install jq
-- ** buffer - true: jsonファイル内だけで有効化
vim.keymap.set("n", "<Leader>j", [[:%!jq '.'<CR>]], {
  buffer = true,
  desc = "format JSON",
})

vim.keymap.set("x", "<Leader>j", [[:'<,'>!jq .<CR>]], {
  buffer = true,
  desc = "format selected JSON",
})
