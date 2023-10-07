syntax enable                         " 構文ごとに色分け
filetype plugin indent on             " ファイルタイプ検出有効化、プラグイン・インデントロード

set number                            " 行番号を表示
set relativenumber                    " 相対表示
set cursorline                        " カーソルk行のハイライト
set cursorcolumn                      " カーソル列のハイライト
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
" set t_Co=256                        " ターミナル色用

set enc=utf-8
set fenc=utf-8                        " 文字コードをUFT-8に設定
" vimdiff
set diffopt+=vertical                 " diffsplit を左右分割をデフォルトに

set gdefault                          " 置換のgオプションを常に有効化
set spelllang=en                      " スペルチェックから日本語を除外
set vb t_vb=                          " ビープ音を消す

let mapleader="\<Space>"

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
"" Ctrl+Tabでタブを切り替える
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
" for vim-airline
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" 検索ハイライトをEscキー2回押しで消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" Escで日本語入力解除
inoremap <ESC> <ESC>:set iminsert=0<CR>

" カーソル位置強調表示のトグル
nnoremap <Leader>c :<C-u>setlocal cursorline! cursorcolumn!<CR>

"vimgrep 移動KEY
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

" set expandtab をトグル
nnoremap <Leader>se :set expandtab!<CR>
" set list をトグル
nnoremap <Leader>sl :set list!<CR>
" ノーマルモードでもエンターキーで改行を挿入
noremap <CR> o<ESC>
" 行末までコピー
nnoremap Y y$
nnoremap <C-t> :tabnew<CR>

" Auto Brackets
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap [ []<LEFT>
inoremap < <><LEFT>
inoremap { {}<LEFT>

" インサートモードでの操作用
inoremap <c-d> <DEL>
inoremap <c-b> <BS>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
"nnoremap ^ $

""""" MyMacros
" Macro [s] : copy song title for CUE-EDIT
let @s='/\dwv/.wavhy/SONGvep0jjj'
" Macro [t] : copy
let @t='pV3jy4j'
" Macro [w] : edit format for CUE-EDIT
let @w='GIFILE "VG:s/.wav/.wav" WAVE/g'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" vim-plug
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Run PlugInstall if there are missing plugins
" autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"   \| PlugInstall --sync | source $MYVIMRC
" \| endif
" nnoremap vrs :source $MYVIMRC<CR>
" nnoremap vpu :PlugInstall<CR>
" nnoremap vpc :PlugClean<CR>
" call
call plug#begin('~/.vim/plugged')
  Plug 'easymotion/vim-easymotion'
  Plug 'itchyny/lightline.vim'
  Plug 'dense-analysis/ale'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'junegunn/vim-easy-align'
  Plug 'dominikduda/vim_current_word'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  " Fern
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/nerdfont.vim'
  Plug 'lambdalisue/fern-renderer-nerdfont.vim'
  " vim-markdown
  Plug 'godlygeek/tabular'
  Plug 'preservim/vim-markdown'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # EasyMotion #
map <Leader> <Plug>(easymotion-prefix)
" <Leader>1{char} to move to {char}
nmap <Leader>1 <Plug>(easymotion-overwin-f)
" <Leader>2{char}{char} to move to {char}{char}
nmap <Leader>2 <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # LightLine #
set laststatus=2
let g:lightline = {'colorscheme': 'one'}
set noshowmode    " 左下の状態表示をしない
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Fern #
nnoremap <silent> <Leader>e :Fern %:h -reveal=% -drawer -toggle -width=35<CR>
let g:fern#renderer = 'nerdfont'
let g:fern#default_hidden=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # vim-easy-align #
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <Leader>a <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <Leader>a <Plug>(EasyAlign)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # vim-markdown #
let g:vim_markdown_folding_disabled = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # vim_current_word #
" Twins of word under cursor:
let g:vim_current_word#highlight_twins = 1
" The word under cursor:
let g:vim_current_word#highlight_current_word = 0
let g:vim_current_word#highlight_delay = 20
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # indent-rainbow #
nmap <Leader>r :call rainbow#toggle()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
""" charm
syntax enable                         " dein対策
packadd! dracula
colorscheme dracula
set modifiable
