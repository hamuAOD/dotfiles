set modifiable
set showtabline=1                           " 2個以上のタブがあるときのみタブバーを表示する

if has('gui_macvim')
" colorscheme iceberg
  " syntax enable
  " packadd! dracula
  " colorscheme dracula
" colorscheme onedark

  set guifont=HackGen35\ Console\ NF:h13
" set guifont=SF\ Mono\ Square:h16
" set guifont=RictyDiminished-Regular:h14
" set guifont=HackGen\ Console:h15
" set guifont=Inconsolata:h14             " フォント設定
" set guifontwide=ヒラギノ角ゴPro:h12     " 日本語フォント設定
  set lines=60 columns=140
  "set guioptions-=T                      " メニューバーを非表示
  set transparency=3
endif
