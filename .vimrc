set tabstop=2                   " タブの画面上での幅
set expandtab                   " タブを空白で挿入
set nu                          " 行番号を表示
set list

set noswapfile                  " スワップファイルを作成しない
set nobackup                    " バックアップファイルを作成しない
set noundofile                  " undofileを作成しない
set showmatch                   " 括弧入力時の対応する括弧を表示

set nowrap                      " 折り返しを無効"

"syntax enable                  " 構文ハイライトを有効

set ignorecase                  " 大文字小文字を区別しない

set tw=0                        " 勝手に改行させない
set formatoptions=q             " 自動改行OFF

set clipboard=unnamed           " クリップボードを使用

set ambiwidth=double

set nrformats=                  " 10進数で扱う

set incsearch                   " インクリメンタル検索

set fenc=utf-8                  " 文字コードをUFT-8に設定
set diffopt+=vertical           " diffsplit を左右分割をデフォルトに
"set encoding=utf-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
"set fileformats=unix,dos,mac

" インサートモードでの操作用
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
nnoremap ^ $

"ノーマルモードでもエンターキーで改行を挿入
noremap <CR> o<ESC>

" Macro [s] : copy song title for CUE-EDIT
let @s='/\dwv/.wavhy/SONGvep0'
" Macro [t] : copy
let @t='pV3jy4j'
" Macro [w] : edit format for CUE-EDIT
let @w='GIFILE "VG:s/.wav/.wav" WAVE/g'

"最後にカーソルがあった場所に移動
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

"自動入力
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>

"Ctrl+Tabでタブを切り替える
nnoremap <C-Tab>   gt
nnoremap <C-S-Tab> gT

"検索ハイライトをEscキー2回押しで消去
set hlsearch
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" 行末の空白削除
autocmd BufWritePre * :%s/\s\+$//e
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Dein #
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/hamu/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/hamu/.vim/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/hamu/.vim/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('easymotion/vim-easymotion')
call dein#add('itchyny/lightline.vim')

" Required:
call dein#end()

" Required:
filetype plugin indent on
"syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # EasyMotion #
let mapleader="\<Space>"
map <Leader> <Plug>(easymotion-prefix)
"let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # LightLine #
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
