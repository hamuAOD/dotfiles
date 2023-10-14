-- local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt
local g = vim.g

-- 「※」等の記号を打つと、半角文字と重なる問題がある。「※」などを全角文字の幅で表示するために設定する
-- opt.ambiwidth = 'double'
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
