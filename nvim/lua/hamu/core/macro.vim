""""" MyMacros
" Macro [s] : copy song title for CUE-EDIT
let @s='/- \dwwv/.wavhy/SONGvep03j'
" Macro [t] : copy
let @t='pV3jy4j'
" Macro [w] : edit format for CUE-EDIT
let @w='VG:s/^/FILE "/gVG:s/.wav/.wav" WAVE/g'
" Macro [r] : set ARTIST Name
let @r='"0x/ARTISTv/"h"0p/ARTISTv/"h"0p:%s/\ \-\ //g'
" Macro [c] : check Format
let @c='/ \l\|[^\x01-\x7E]'

" 最後にカーソルがあった場所に移動
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
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
