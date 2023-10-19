-- local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt
local g = vim.g

-- 「※」等の記号を打つと、半角文字と重なる問題がある。「※」などを全角文字の幅で表示するために設定する
-- opt.ambiwidth = 'double'
-- opt.ambiwidth = 'single'
-- 新しい行を改行で追加した時に、ひとつ上の行のインデントを引き継がせます。
opt.autoindent = true
opt.smartindent = true
-- smartindent と cindent を両方 true にしたときは、cindent のみ true になるようです。
-- opt.cindent = true

vim.opt.termguicolors = true

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorcolumn = true
opt.wrap = false
opt.ignorecase = true                                   -- 大文字小文字を無視
opt.incsearch = true
opt.hlsearch = true
opt.termguicolors = true
opt.clipboard = "unnamedplus"

opt.list = true
-- opt.listchars = { eol = '$', tab = '>-', trail = '_' }  -- 特殊文字の表示設定
opt.listchars = { eol = '↲', tab = '»-', trail = '_' }  -- 特殊文字の表示設定

opt.emoji = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2                        -- インデントの空白数
opt.autoindent = true                     -- 自動インデントを有効にする
opt.smartindent = true                    -- インデントをスマートに調整する
opt.tabstop = 2                           -- タブの画面上での幅
opt.softtabstop = 2                       -- 連続した空白でカーソルが動く幅
opt.showmatch = true                      -- 括弧入力時の対応する括弧を表示
opt.matchtime=1                           --"対括弧を一時ジャンプ
opt.iskeyword:append("-")
--set pumheight=10                        " 補完メニューの高さ固定
--
--set nobackup                          " バックアップファイルを作成しない
--set noswapfile                        " スワップアップファイルを作成しない
--set noundofile                        " undofileを作成しない
--
opt.nrformats = "unsigned"

opt.completeopt = { "menuone", "preview" }

opt.guifont = { "HackGen35 Console NF", "h14" }

vim.fn.setcellwidths {
  { 0x2031, 0x2031, 2},
  { 0x203b, 0x203b, 2},
  { 0x2103, 0x2179, 2},
  { 0x2460, 0x24ff, 2},
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
--
--opt.fillchars = { eob = " " }
--opt.smartcase = true
--opt.mouse = "a"
--
---- disable nvim intro
--opt.shortmess:append "sI"
--
--opt.signcolumn = "yes"
--opt.splitbelow = true
--opt.splitright = true
--opt.termguicolors = true
--opt.timeoutlen = 400
--opt.undofile = true

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
