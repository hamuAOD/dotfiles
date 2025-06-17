-- local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt
-- local global = vim.g

---- disable netrw at the very start of your init.lua
vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true                                       -- 行番号表示
opt.relativenumber = true                               -- 行番号相対表示
opt.numberwidth = 4                                     -- 行番号表示の幅設定
opt.signcolumn = "yes"                                  -- 行位置を常に表示
opt.showmatch = true                                    -- 括弧入力時の対応する括弧を表示
opt.matchtime  = 1                                      -- 対括弧を一時ジャンプ
opt.iskeyword:append("-", "_")                          -- キーワードの一部として扱う：選択時に含まれる
opt.cursorline = true                                   -- カーソルのある行をハイライト
opt.cursorcolumn = true                                 -- カーソルのある列をハイライト
opt.wrap = false                                        -- 折り返し設定
opt.termguicolors = true                                -- 24bitカラー表示を有効にする
opt.clipboard:append{'unnamedplus'}                     -- クリップボードと連携する
opt.list = true                                         -- 特殊文字の表示
opt.listchars = { eol = '$', tab = '>-', trail = '_' }  -- 特殊文字の表示設定
-- opt.listchars = { eol = '↲', tab = '»-', trail = '_' }  -- 特殊文字の表示設定
opt.showcmd = true                                      -- コマンドを入力中に表示設定するかどうか
-- opt.splitbelow = true                                -- 上下分割時下に表示
-- opt.splitright = true                                -- 左右分割時右に表示
--set pumheight=10                                      -- 補完メニューの高さ固定
opt.shortmess:append "sI"                               -- disable nvim intro
opt.winblend = 20                                       -- フロートウィンドウなどを若干透明に
opt.spell = false                                       -- スペルチェック有効

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.breakindent = true                                  -- 折り返された行を同じインデントで表示する
opt.expandtab   = true                                  -- tabstop で指定したインデント
opt.autoindent  = true                                  -- 自動インデントを有効にする
opt.smartindent = true                                  -- 自動インデント設定
-- opt.cindent = true
-- smartindent と cindent を両方 true にしたときは、cindent のみ true になるようです。
opt.tabstop = 2                                         -- タブの画面上での幅
opt.softtabstop = 2                                     -- 連続した空白でカーソルが動く幅
opt.shiftwidth = 2                                      -- インデントの空白数
opt.smarttab = true                                     -- インデントの自動調整
opt.formatoptions:remove('q')                           -- 自動改行OFF

-----------------------------------------------------------
-- Search
-----------------------------------------------------------
opt.incsearch  = true                                   -- 検索語を入力中にハイライトを表示
opt.hlsearch   = true                                   -- 検索語をハイライト表示
opt.ignorecase = true                                   -- 検索時に大文字小文字を区別しない
opt.smartcase  = true                                   -- 検索語に大文字が含まれている場合は区別する

-----------------------------------------------------------
-- Backups
-----------------------------------------------------------
opt.backup = false                                      -- バックアップファイルを作成しない
opt.swapfile = false                                    -- スワップアップファイルを作成しない
opt.undofile = true                                     -- undofileを作成しない

-----------------------------------------------------------
-- Encoding
-----------------------------------------------------------
vim.scriptencoding = 'utf-8'
opt.encoding       = 'utf-8'
opt.fileencoding   = 'utf-8'

-----------------------------------------------------------
-- Other Settings
-----------------------------------------------------------
-- opt.guifont = { "HackGen35 Console NF", "h13" }
opt.ambiwidth = 'single'                                -- 'double' | 「※」等の記号を打つと、半角文字と重なる問題がある。「※」などを全角文字の幅で表示するために設定する
opt.fillchars = { fold = " ", eob = " " }                           -- 行末の空白の表示
opt.emoji = true                                        -- Unicode絵文字を全角とみなす
opt.helplang = 'ja'                                     -- 'en' | ヘルプ言語設定
opt.spelllang = { 'en_us', 'cjk' }                      -- スペルチェックから日本語を除外
opt.title = true                                        -- ファイル情報等表示
opt.nrformats = "unsigned"                              -- 0x00とかを数字としてみなす
opt.hidden = true                                       -- 編集中のバッファを保存しないで切り替え可能
-- 補完メニューの表示設定
opt.completeopt = { "menuone", "preview" }              -- 候補が1つでも表示、付加情報をプレビューに表示
-- 非アクティブなウィンドウの設定
vim.api.nvim_win_set_option(0, 'signcolumn', 'yes:1')

-- 折り畳み設定

opt.foldmethod = 'expr'
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = [[vim.treesitter.foldtext()]]
-- opt.foldtext = [["v:lua.FoldText()"]]
vim.o.foldcolumn = "1"                                  -- 左に折りたたみインジケーターを表示（任意）
vim.o.foldlevel = 99                                    -- すべて展開された状態で開始
vim.o.foldlevelstart = 2
vim.o.foldenable = true

-----------------------------------------------------------
-- VIM Command
-----------------------------------------------------------
-- call macros
-- vim.cmd('source ~/.config/nvim/lua/hamu/core/macro.vim')

-- Change colors
vim.cmd('autocmd ColorScheme * highlight CursorColumn guibg=#474a5d')
vim.cmd('autocmd ColorScheme * highlight CursorLine guibg=#474a5d')
-- vim.cmd('autocmd ColorScheme * highlight Whitespace guifg=#FF79C6')
vim.cmd('autocmd ColorScheme * highlight LineNrAbove guifg=#6272A4')
vim.cmd('autocmd ColorScheme * highlight LineNrBelow guifg=#6272A4')

-- set filetype
vim.cmd('autocmd BufNewFile,BufRead *.xdc set filetype=xdc')
vim.cmd('autocmd BufNewFile,BufRead *.txt set filetype=text')
vim.cmd('autocmd BufNewFile,BufRead *.txt highlight Whitespace guifg=#FF79C6')

-----------------------------------------------------------
-- 最後にカーソルがあった場所に移動
-----------------------------------------------------------
local cursor_group = vim.api.nvim_create_augroup("RememberCursor", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  group = cursor_group,
  pattern = "*",
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 1 and last_pos <= vim.fn.line("$") then
      vim.cmd('normal! g`"')
    end
  end
})
-- augroup vimrc-remember-cursor-position
--   autocmd!
--   autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
-- augroup END

-----------------------------------------------------------
-- 保存時の処理
-----------------------------------------------------------
local save_cleanup_group = vim.api.nvim_create_augroup("SaveCleanup", { clear = true })
-- 保存時に行末の空白削除
vim.api.nvim_create_autocmd("BufWritePre", {
  group = save_cleanup_group,
  pattern = "*",
  command = [[%s/\s\+$//ge]]
})
-- 保存時にFC2のゴミ削除
vim.api.nvim_create_autocmd("BufWritePre", {
  group = save_cleanup_group,
  pattern = "*",
  command = [[%s/\*\*\*ysqxzzosy//ge]]
})
-- autocmd BufWritePre * :%s/\s\+$//ge
-- autocmd BufWritePre * :%s/\*\*\*ysqxzzosy//ge
-- option e : マッチしなかった時にエラーメッセージを表示しない

-----------------------------------------------------------
-- 特定文字の強調
-----------------------------------------------------------
local emphasis_bad_char = vim.api.nvim_create_augroup("BadChar", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = emphasis_bad_char,
    pattern = "*",
    command = [[match Error /‐\|–\|“\|’\| \+$/]]
})
-- augroup BadChar
--   au!
--   autocmd BufWinEnter * match Error /‐\|–\|“\|’\| \+$/
-- augroup END

-----------------------------------------------------------
-- Set 2-byte char.
-----------------------------------------------------------
vim.fn.setcellwidths {
  { 0x2030, 0x2030, 2},
  { 0x2032, 0x2033, 2},
  { 0x2035, 0x2035, 2},
  { 0x203b, 0x203b, 2},
  { 0x203e, 0x203e, 2},
  { 0x2103, 0x2103, 2},
  { 0x2160, 0x2267, 2},
  { 0x2460, 0x24ff, 2},
  { 0x25a0, 0x25cf, 2},
  { 0x2600, 0x2647, 2},
  { 0x2654, 0x26a9, 2},
  { 0x26ad, 0x2702, 2},
  { 0x2713, 0x2718, 2},
  { 0x271a, 0x271d, 2},
  { 0x273d, 0x273d, 2},
  { 0x273f, 0x2740, 2},
  { 0x2776, 0x2793, 2},
  { 0x303f, 0x303f, 2},
  { 0xe0c0, 0xe0d1, 2},
  { 0xe201, 0xe201, 2},
  { 0xe203, 0xe209, 2},
  { 0xe20d, 0xe212, 2},
  { 0xe214, 0xe215, 2},
  { 0xe217, 0xe220, 2},
  { 0xe224, 0xe232, 2},
  { 0xe234, 0xe239, 2},
  { 0xe23c, 0xe251, 2},
  { 0xe253, 0xe258, 2},
  { 0xe25a, 0xe25b, 2},
  { 0xe25d, 0xe25e, 2},
  { 0xe264, 0xe2a0, 2},
  { 0xe2a2, 0xe33d, 2},
  { 0xe341, 0xe7bc, 2},
  { 0xe7c4, 0xf0fe, 2},
  { 0xf108, 0xf115, 2},
  { 0xf118, 0xf2e0, 2},
  { 0xf300, 0xf30f, 2},
  { 0xf310, 0xf430, 2},
  { 0xf435, 0xf479, 2},
  { 0xf47f, 0xf4a8, 2},
}
