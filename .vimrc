syntax enable                         " 構文ごとに色分け
filetype plugin indent on             " ファイルタイプ検出有効化、プラグイン・インデントロード

set number                            " 行番号を表示
set cursorline                        " 行番号のハイライト
set nowrap                            " 折り返しを無効"
set ignorecase                        " 検索で大文字小文字を区別しない
set incsearch                         " インクリメンタル検索
set hlsearch                          " ハイライト検索
set list                              " タブ，行末を可視化
set listchars=eol:$,tab:>-,trail:_    " 特殊文字の表示設定
set expandtab                         " <Tab>を空白で入力
set tabstop=2                         " タブの画面上での幅
set shiftwidth=2                      " インデントの空白数
set softtabstop=2                     " 連続した空白でカーソルが動く幅
set showmatch                         " 括弧入力時の対応する括弧を表示
set matchtime=1                       " 対括弧を一時ジャンプ
set pumheight=10                      " 補完メニューの高さ固定

set nobackup                          " バックアップファイルを作成しない
set noswapfile                        " スワップアップファイルを作成しない
set noundofile                        " undofileを作成しない
set clipboard+=unnamed                " クリップボードを使用

"set colorcolumn=80                    " カラムラインを引く

set tw=0                              " 勝手に改行させない textwidth
set formatoptions=q                   " 自動改行OFF

set ambiwidth=double                  " 全角記号対策
set nrformats=                        " 10進数で扱う
set t_Co=256                          " ターミナル色用

set enc=utf-8
set fenc=utf-8                        " 文字コードをUFT-8に設定
" vimdiff
set diffopt+=vertical                 " diffsplit を左右分割をデフォルトに

set gdefault                          " 置換のgオプションを常に有効化
set spelllang=en                      " スペルチェックから日本語を除外
set vb t_vb=                          " ビープ音を消す

""""" 自動化 """""
autocmd BufWritePre * :%s/\s\+$//ge   " 保存時に行末の空白削除
let g:vimfiler_enable_auto_cd = 1     " 自動でカレントディレクトリを変更する設定

" インサートモードに入る時に自動でコメントアウトされないようにする
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" 自動補完を自動で表示
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor

" 最後にカーソルがあった場所に移動
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

""""" Key Bindings """""
" Ctrl+Tabでタブを切り替える
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT

" 検索ハイライトをEscキー2回押しで消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"vimgrep 移動KEY
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

nnoremap <C-e> :set expandtab!<CR>    " set expandtab のトグル
nnoremap <C-i> :set list!<CR>         " set list のトグル
nnoremap <C-n> :tab sp<CR>            " 現在のファイルを新しいタブで開く
noremap <CR> o<ESC>                   " ノーマルモードでもエンターキーで改行を挿入
nnoremap Y y$                         " 行末までコピー
"nnoremap <C-q> :q<CR>
nnoremap <C-t> :tabnew<CR>

" 括弧自動入力
inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap [ []<LEFT>

" インサートモードでの操作用
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
"nnoremap ^ $

""""" Macros """""
" Macro [s] : copy song title for CUE-EDIT
let @s='/\dwv/.wavhy/SONGvep0jjj'
" Macro [t] : copy
let @t='pV3jy4j'
" Macro [w] : edit format for CUE-EDIT
let @w='GIFILE "VG:s/.wav/.wav" WAVE/g'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let mapleader="\<Space>"
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
syntax enable                         " dein対策
