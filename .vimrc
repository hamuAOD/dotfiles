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
"set expandtab                         " <Tab>を空白で入力
set tabstop=2                         " タブの画面上での幅
set shiftwidth=2                      " インデントの空白数
set softtabstop=2                     " 連続した空白でカーソルが動く幅
set showmatch                         " 括弧入力時の対応する括弧を表示
set matchtime=1                       " 対括弧を一時ジャンプ
set pumheight=10                      " 補完メニューの高さ固定
set hidden                            " 編集中のバッファを保存しないで切り替え可能
set spell                             " スペルチェック有効化
set spelllang=en_us,cjk               " スペルチェックから日本語を除外

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
set vb t_vb=                          " ビープ音を消す

let mapleader="\<Space>"
let maplocalleader = ','
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" 自動化 """""
autocmd BufWritePre * :%s/\s\+$//ge             " 保存時に行末の空白削除
autocmd BufWritePre * :%s/\*\*\*ysqxzzosy//ge   " for FC2
""" for SAMBA
autocmd BufWritePost * sleep 100m
autocmd BufWritePost * checktime
set autoread
" option e : マッチしなかった時にエラーメッセージを表示しない
let g:vimfiler_enable_auto_cd = 1     " 自動でカレントディレクトリを変更する設定

" インサートモードに入る時に自動でコメントアウトされないようにする
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" 自動補完を自動で表示
set completeopt=menuone,noinsert
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
  autocmd BufWinEnter * match Error /‐\|–\|“\|’\|е\| \+$/
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Key Bindings """""
"" Ctrl+Tabでタブを切り替える
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
" for Buffer
nnoremap <C-n> <CMD>bn<CR>
nnoremap <C-p> <CMD>bp<CR>
nnoremap <C-d> <CMD>bd<CR>

" 検索ハイライトをEscキー2回押しで消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" Escで日本語入力解除
" inoremap <ESC> <ESC>:set iminsert=0<CR>

"vimgrep 移動KEY
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>

" set expandtab をトグル
nnoremap <Leader>te :set expandtab!<CR>
" set list をトグル
nnoremap <Leader>tl :set list!<CR>
" set spell をトグル
nnoremap <Leader>ts :set spell!<CR>
" カーソル位置強調表示のトグル
nnoremap <Leader>tc :<C-u>setlocal cursorline! cursorcolumn!<CR>

" ノーマルモードでもエンターキーで改行を挿入
noremap <CR> o<ESC>
" 行末までコピー
nnoremap Y 0y$
" リドゥ リマップ
nnoremap U <C-r>
" 括弧ジャンプ
nnoremap M %
" nnoremap <C-t> :tabnew<CR>
" スペル修正
inoremap <C-t> <Esc><Left>"zx"zpa
" 空行での編集開始時に自動でインデント
nnoremap <expr> i empty(getline('.')) ? '"_cc' : 'i'
nnoremap <expr> A empty(getline('.')) ? '"_cc' : 'A'
" カーソル下のキーワードを置換
nnoremap S :%s/\V\<<C-r><C-w>\>//<Left>
xnoremap S "zy:%s/\V<C-r><C-r>=escape(@z,'/\')<CR>//gce<Left><Left><Left><Left>
" ペースト結果のインデントを自動で揃える
nnoremap p ]p`]
nnoremap P ]P`]
" osc52
vnoremap Y y:call SendViaOSC52(getreg('"'))<CR>
" 単語として認識
set iskeyword+=-

" CUEファイルチェック用検索
nnoremap <Leader>c /\( \l\\|[^\x01-\x7E]\\|TITLE\)<CR>

"""" MyMacros
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim function
function s:toupper_prev_word()
  let col = getpos('.')[2]
  let substring = getline('.')[0:col-1]
  let word = matchstr(substring, '\v<(\k(<)@!)*$')
  return toupper(word)
endfunction

inoremap <expr> <C-u> "<C-w>" .. <SID>toupper_prev_word()

inoremap <C-o> <ESC>bgUlgi
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
  Plug 'junegunn/vim-easy-align'
  Plug 'dominikduda/vim_current_word'
  " Plug 'nathanaelkane/vim-indent-guides'
  Plug 'RRethy/vim-illuminate'
  Plug 'chrisbra/Colorizer'
  Plug 'liuchengxu/vim-which-key'
  Plug 'yoshida-m-3/vim-im-select'
  Plug 'Yggdroot/indentLine'
  Plug 'cohama/lexima.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'ap/vim-buftabline'
  " for SSH
  Plug 'ShikChen/osc52.vim'
  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  " Fern
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/nerdfont.vim'
  Plug 'lambdalisue/fern-renderer-nerdfont.vim'
  " fzf"
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " LSP
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  " Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  " vim-markdown
  Plug 'godlygeek/tabular'
  Plug 'preservim/vim-markdown'
  " Colorscheme
  Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # fzf #
set rtp+=/opt/homebrew/opt/fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # vim-im-select #
let g:im_select_default = 'com.apple.keylayout.ABC'
let g:im_select_enable_for_gvim = 1
" com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese
" com.apple.inputmethod.Kotoeri.RomajiTyping.Roman'
" com.apple.keylayout.ABC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # EasyMotion #
" map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_do_mapping = 1     " Disable default mappings
" WB motions: Line motions
map <Leader>mw <Plug>(easymotion-w)
map <Leader>mb <Plug>(easymotion-b)
" JK motions: Line motions
map <Leader>mj <Plug>(easymotion-j)
map <Leader>mk <Plug>(easymotion-k)
" <Leader>1{char} to move to {char}
nmap <Leader>mf <Plug>(easymotion-overwin-f)
" <Leader>2{char}{char} to move to {char}{char}
nmap <Leader>mg <Plug>(easymotion-overwin-f2)

" map <Leader> <Plug>(easymotion-prefix)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" let g:EasyMotion_use_upper = 1        " 'l' -> 'l' & 'L'
let g:EasyMotion_use_smartsign_jp = 1 " JP layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # LightLine #
set laststatus=2
set noshowmode    " 左下の状態表示をしない
" let g:lightline = {'colorscheme': 'one'}
let g:lightline = {
      \ 'colorscheme': 'one',
			\ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Fern #
nnoremap <silent> <Leader>e :Fern %:h -reveal=% -drawer -toggle -width=35<CR>
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
" # LSP #
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1  " enable echo under cursor when in normal mode
let g:lsp_diagnostics_float_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_diagnostics_echo_cursor = 1
highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green
" # asyncomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # vim-easy-align #
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <Leader>ae <Plug>(EasyAlign)
nmap <Leader>ae <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # vim-markdown #
let g:vim_markdown_folding_disabled = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # vim_current_word #
" Twins of word under cursor:
let g:vim_current_word#enabled = 1
let g:vim_current_word#highlight_twins = 1
" The word under cursor:
let g:vim_current_word#highlight_current_word = 1
let g:vim_current_word#highlight_delay = 20
" Please add below in your vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # lexima #
call lexima#add_rule({'char': '<', 'input_after': '>'})
" call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'latex'})
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # indentLine#
let g:indentLine_char = '⎸' " ¦, ┆, │, ⎸, or ▏
" let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
" Disable by default
let g:indentLine_enabled = 0
noremap <silent> <leader>ti :IndentLinesToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # vim-indent-guides #
" let g:indent_guides_enable_on_vim_startup = 1
" " let g:indent_guides_start_level = 2
" " let g:indent_guides_guide_size = 1
" let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']
" noremap <silent> <leader>ti :IndentGuidesToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # Colorizer #
noremap <silent> <leader>tz :ColorToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" # whitch-key #
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
call which_key#register('<Space>', "g:which_key_map")
set timeoutlen=500

let g:which_key_map = {}

let g:which_key_map.a = {
      \ 'name' : '+align',
      \ 'e' : 'Easy-Align',
      \}
let g:which_key_map.e = 'toggle Explorer'
let g:which_key_map.f = {
      \ 'name' : '+fzf',
      \ 'f' : 'Files',
      \ 'g' : 'Grep',
      \ 'b' : 'Buffers',
      \ 'h' : 'History',
      \}
let g:which_key_map.t = {
      \ 'name' : '+toggle',
      \ 'e' : 'Expandtab',
      \ 'i' : 'Indent-Lines',
      \ 'l' : 'List',
      \ 'c' : 'Cursor',
      \ 's' : 'Spell',
      \ 'z' : 'Colorizer',
      \}
let g:which_key_map.m = {
      \ 'name' : '+EasyMotion',
      \ 'w' : 'Jump to lower word',
      \ 'b' : 'Jump to upper word',
      \ 'j' : 'Jump to upper line',
      \ 'k' : 'Jump to lower line',
      \ 'f' : 'Jump to 1 char',
      \ 'g' : 'Jump to 2 char',
      \}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Background transparent
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
colorscheme dracula
set modifiable
