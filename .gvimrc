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

    set guifont=HackGen35\ Console\ NF:h13
"   set guifont=SF\ Mono\ Square:h16
"   set guifont=RictyDiminished-Regular:h14
"   set guifont=HackGen\ Console:h15
"   set guifont=Inconsolata:h14             " フォント設定
"   set guifontwide=ヒラギノ角ゴPro:h12     " 日本語フォント設定
    set lines=60 columns=140
    "set guioptions-=T                      " メニューバーを非表示
    set transparency=5
endif
