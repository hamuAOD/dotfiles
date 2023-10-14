-- 最後にカーソルがあった場所に移動
vim.cmd([[
  augroup vimrcEx
    au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
  augroup END
]])
--  保存時に行末の空白削除
vim.cmd([[
  autocmd BufWritePre * :%s/\s\+$//ge
]])
