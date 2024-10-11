""""" MyMacros
" Macro [c] : check Format
let @c='/ \l\|[^\x01-\x7E]\|TITLE'

" 最後にカーソルがあった場所に移動
" augroup vimrcEx
"   au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" augroup END
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup vimrc-samba-delay
  autocmd BufWritePost * sleep 100m
  autocmd BufWritePost * checktime
  set autoread
augroup END

" 保存時に行末の空白削除
autocmd BufWritePre * :%s/\s\+$//ge
" for FC2
 autocmd BufWritePre * :%s/\*\*\*ysqxzzosy//ge
" option e : マッチしなかった時にエラーメッセージを表示しない

" 特定文字の強調
augroup BadChar
  au!
  autocmd BufWinEnter * match Error /‐\|–\|“\|’\| \+$/
augroup END
