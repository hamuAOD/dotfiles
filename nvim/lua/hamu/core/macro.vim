"" 空行での編集開始時に自動でインデント
nnoremap <expr> i empty(getline('.')) ? '"_cc' : 'i'
nnoremap <expr> A empty(getline('.')) ? '"_cc' : 'A'

" 最後にカーソルがあった場所に移動
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" for SAMBA -> delete: oil.nvim
"augroup vimrc-samba-delay
"  autocmd BufWritePost * sleep 100m
"  autocmd BufWritePost * checktime
"  set autoread
"augroup END

" 保存時に行末の空白削除
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にFC2のゴミ削除
autocmd BufWritePre * :%s/\*\*\*ysqxzzosy//ge
" option e : マッチしなかった時にエラーメッセージを表示しない

" 特定文字の強調
augroup BadChar
  au!
  autocmd BufWinEnter * match Error /‐\|–\|“\|’\| \+$/
augroup END
