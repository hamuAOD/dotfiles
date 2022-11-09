set modifiable
set showtabline=1                           " 2個以上のタブがあるときのみタブバーを表示する
set noimdisable                             " IMEを自動でOFF設定
"set iminsert=2

if has('gui_macvim')
"   colorscheme iceberg
    syntax enable
    packadd! dracula
    colorscheme dracula
"   colorscheme onedark

"   set guifont=RictyDiminished-Regular:h13
    set guifont=SF\ Mono\ Square:h14
    "set guifont=Inconsolata:h14            " フォント設定
    "set guifontwide=ヒラギノ角ゴPro:h12    " 日本語フォント設定
    set lines=50 columns=120
    "set guioptions-=T                      " メニューバーを非表示
    set transparency=6
endif
