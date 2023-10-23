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
set listchars=eol:↲,tab:>-,trail:_    " 特殊文字の表示設定
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

let mapleader="\<Space>"
let maplocalleader = ','
let g:which_key_map = {}

""""" 自動化 """""
autocmd BufWritePre * :%s/\s\+$//ge   " 保存時に行末の空白削除
" option e : マッチしなかった時にエラーメッセージを表示しない
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

" 特定文字の強調
augroup BadChar
  au!
  autocmd BufWinEnter * match Error /‐\| \+$/
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

"vimgrep 移動KEY
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

let g:which_key_map.s = { 'name' : '+set toggle' }
" set expandtab をトグル
nnoremap <Leader>se :set expandtab!<CR>
let g:which_key_map.s.e = 'Toggle expandtab'
" set list をトグル
nnoremap <Leader>sl :set list!<CR>
let g:which_key_map.s.l = 'Toggle list'
" カーソル位置強調表示のトグル
nnoremap <Leader>sc :<C-u>setlocal cursorline! cursorcolumn!<CR>
let g:which_key_map.s.c = 'Toggle cursor'

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

" osc52
vnoremap Y y:call SendViaOSC52(getreg('"'))<CR>
" 単語として認識
set iskeyword+=-

""""" MyMacros
" Macro [s] : copy song title for CUE-EDIT
" let @s='/\dwv/.wavhy/SONGvep0jjj'
let @s='/- \dwwv/.wavhy/SONGvep03j'
" Macro [t] : copy
let @t='pV3jy4j'
" Macro [w] : edit format for CUE-EDIT
" let @w='GIFILE "VG:s/.wav/.wav" WAVE/g'
" let @w='0GIFILE "wGdVG:s/.wav/.wav" WAVE/g'
let @w='0GIFILE "wGdVG:s/.wav/.wav" WAVE/g'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" vim-plug
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync
  \| set modifiable
  \| source $MYVIMRC
  " \| PlugInstall --sync | source '~/.vimrc'
\| endif
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
  " Plug 'Yggdroot/indentLine'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'RRethy/vim-illuminate'
  Plug 'liuchengxu/vim-which-key'
  " for SSH
  Plug 'ShikChen/osc52.vim'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  " LSP
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  " Fern
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/nerdfont.vim'
  Plug 'lambdalisue/fern-renderer-nerdfont.vim'
  " fzf"
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " vim-markdown
  Plug 'godlygeek/tabular'
  Plug 'preservim/vim-markdown'
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # fzf #
set rtp+=/opt/homebrew/opt/fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # EasyMotion #
let g:EasyMotion_do_mapping = 1     " Disable default mappings
" WB motions: Line motions
map <Leader>ew <Plug>(easymotion-w)
map <Leader>eb <Plug>(easymotion-b)
" JK motions: Line motions
map <Leader>ej <Plug>(easymotion-j)
map <Leader>ek <Plug>(easymotion-k)
" <Leader>1{char} to move to {char}
nmap <Leader>ef <Plug>(easymotion-overwin-f)
" <Leader>2{char}{char} to move to {char}{char}
nmap <Leader>eg <Plug>(easymotion-overwin-f2)
" map <Leader> <Plug>(easymotion-prefix)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" let g:EasyMotion_use_upper = 1        " 'l' -> 'l' & 'L'
let g:EasyMotion_use_smartsign_jp = 1 " JP layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # LightLine #
set laststatus=2
let g:lightline = {'colorscheme': 'one'}
set noshowmode    " 左下の状態表示をしない
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Fern #
nnoremap <silent> <Leader>ee :Fern %:h -reveal=% -drawer -toggle -width=35<CR>
let g:fern#renderer = 'nerdfont'
let g:fern#default_hidden=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # fzf
let $FZF_DEFAULT_OPTS="--layout=reverse"
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**'"
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }

nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :Rg<CR>
" nnoremap <silent> <leader>fg :GFiles<CR>
" nnoremap <silent> <leader>fG :GFiles?<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fh :History<CR>
" nnoremap <silent> <leader>fr :Rg<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # vim-easy-align #
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <Leader>ea <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <Leader>ea <Plug>(EasyAlign)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # vim-markdown #
" let g:vim_markdown_folding_disabled = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # vim_current_word #
" Twins of word under cursor:
let g:vim_current_word#enabled = 1
let g:vim_current_word#highlight_twins = 1
" The word under cursor:
let g:vim_current_word#highlight_current_word = 0
let g:vim_current_word#highlight_delay = 20
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # indentLine#
" set list listchars=tab:\¦\
" let g:indentLine_char = '¦' " ¦, ┆, │, ⎸, or ▏
" let g:indentLine_setColors = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # vim-indent-guides #
let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # whitch-key #
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>
set timeoutlen=500
let g:which_key_map = {}
" autocmd! FileType which_key
" autocmd  FileType which_key set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" let g:which_key_map.s = {
"       \ 'name' : '+set toggle',
"       \ 'e' : ['set expandtab!', 'Toggle expandtab'],
"       \ 'l' : ['set list!', 'Toggle list'],
"       \ 'c' : ['setlocal cursorline! cursorcolumn!!', 'Toggle cursor'],
"       \ }
" let g:which_key_map.m = { 'name' : 'EasyMotion' }
" let g:which_key_map.m.w = 'Jump to WORD'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" install Dracula colortheme
if empty(glob('~/.vim/pack/themes/start/dracula/colors/dracula.vim'))
  silent !mkdir -p ~/.vim/pack/themes/start && \
  !git clone https://github.com/dracula/vim.git ~/.vim/pack/themes/start/dracula
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packadd! dracula
syntax enable                         " dein対策
colorscheme dracula
set modifiable
