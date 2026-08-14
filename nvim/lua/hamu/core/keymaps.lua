-- set Leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap
local fn = require("hamu.core.functions")

--- 検索ハイライトをEscキー2回押しで消去
keymap.set('n', '<ESC><ESC>', '<CMD>nohlsearch<CR>')

--- "jk" で ESC
keymap.set("i", "jk", "<Esc>")
--- jk の認識時間を短めに（デフォルト 1000ms → 300ms）
vim.o.timeoutlen = 500

--- Change Keymaps
keymap.set('n', 'Y', 'y$')                -- 行末までコピー
keymap.set('n', 'U', '<c-r>')             -- リドゥ
keymap.set('n', 'M', '%')                 -- 括弧ジャンプ
keymap.set('x', 'M', '%')                 -- 括弧ジャンプ
keymap.set('n', '<CR>', 'o<ESC>')         -- 改行だけ挿入
keymap.set('n', 'gg', '0gg')              -- Vim Styleの先頭へ移動

-- keymap.set('n', '*', '/<C-r><C-w><CR>N')  -- 検索後にカーソルを移動しない

-- for Mac
keymap.set('n', '<D-c>', 'y')
keymap.set('n', '<D-v>', 'p')

-- Keymaps for functions.lua
-- x : visual mode
-- v : visual mode & select mode
keymap.set("n", "<Leader>cc", fn.check_cue, { desc = "Search: Check CUE", })
keymap.set("n", "<Leader>mc", fn.prefix_char_count, { desc = "Prefix line with char count", })
keymap.set("n", "<Leader>cn", "<CMD>NormalizeCaps<CR>", { desc = "Normalize caps", })
keymap.set("x", "<Leader>cn", ":NormalizeCaps<CR>", { desc = "Normalize caps", })
keymap.set("n", "<leader>ct", "<CMD>FormatDateP<CR>", { desc = "Convert YYYYMMDD → YYYY-MM-DD in selection" })
keymap.set("x", "<leader>ct", ":FormatDateP<CR>", { desc = "Convert YYYYMMDD → YYYY-MM-DD in selection" })
keymap.set('n', '<Leader>tm', '<CMD>ToggleChecklist<CR>', { desc = "Toggle checklist checkbox" })
keymap.set('x', '<Leader>tm', ':ToggleChecklist<CR>', { desc = "Toggle selected checklist checkboxes" })
keymap.set('n', "<Leader>sl", "<CMD>ReplaceFinderCR<CR>", { desc = "Replace CR for Mac" })
keymap.set('x', "<Leader>sl", ":ReplaceFinderCR<CR>", { desc = "Replace CR for Mac" })
keymap.set('n', 'i', fn.empty_line_insert, { expr = true })
keymap.set('n', 'A', fn.empty_line_append, { expr = true })
keymap.set("n", "<Leader>cp", fn.paste_fdb, { desc = "Paste clipboard with db-style", })

--- カーソルの直前の単語の先頭を大文字にする
keymap.set('i', '<C-y>', '<ESC>bguwgUlgi')
--- カーソルの直前の単語を全てを大文字にする
keymap.set('i', '<C-o>', '<ESC>bveUgi')
--- カーソルの直前の単語を全てを大文字にする
--- カーソル直前に空白がある場合は単語を取得できないため一時的に無効化
--- 気が向いたらfunctionごと削除
-- keymap.set("i", "<C-u>", fn.uppercase_previous_word, { expr = true })

--- インデント操作を連続でできるように
keymap.set('x', '<', '<gv')
keymap.set('x', '>', '>gv')
--- ウィンドウの幅調整
keymap.set('n', '<', '<C-w><<C-w>')
keymap.set('n', '>', '<C-w>><C-w>')
--- Current Directoryをファイルの場所にを変更
keymap.set('n', '<Leader>cd', '<CMD>cd %:h<CR>', {desc = "Change Current Directory"})
--- カーソル下のキーワードを置換
keymap.set('n', 'S', ':%s/\\V\\<<C-r><C-w>\\>//ge<Left><Left><Left>')
--- 選択したキーワードを置換
keymap.set('x', 'S', '"zy:%s/\\V<C-r><C-r>=escape(@z,\' /\\\')<CR>//ge<Left><Left><Left>')
--- ペースト結果のインデントを自動で揃える
keymap.set('n', 'p', ']p`]')
keymap.set('n', 'P', ']P`]')
-- Escで日本語入力解除
-- vim.keymap.set('i', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>')
-- vim.keymap.set('n', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>')

--- 画面分割s
keymap.set('n', '<Leader>pS', '<CMD>split<CR><C-w>w', {desc = "Split Window Holizontal"})
keymap.set('n', '<Leader>ps', '<CMD>vsplit<CR><C-w>w', {desc = "Split Window Vertical"})
--- 画面移動
keymap.set('n', '<Leader>pn', '<C-w>w', {desc = "Next Pane"})
keymap.set('n', '<Leader>pp', '<C-w><S-w>', {desc = "Previous Pane"})
--- バッファ移動
keymap.set('n', '<C-p>', '<CMD>bprev<CR>')    -- Buffer Previous
keymap.set('n', '<C-n>', '<CMD>bnext<CR>')    -- Buffer Next
keymap.set('n', '<C-d>', '<CMD>bdelete<CR>')  -- Buffer Delete

--- fold
keymap.set('n', 'zj', 'za', {desc = "Toggle fold under cursor"})
keymap.set('n', 'zJ', 'zA', {desc = "Toggle all folds under cursor"})

keymap.set("n", "<Leader>tfu", "<CMD>ToggleFoldLevel1<CR>", {desc = "Toggle Fold Level1"})
keymap.set("n", "<Leader>tfi", "<CMD>ToggleFoldLevel2<CR>", {desc = "Toggle Fold Level2"})
keymap.set("n", "<Leader>tfo", "<CMD>ToggleFoldLevel3<CR>", {desc = "Toggle Fold Level3"})
keymap.set("n", "<Leader>tfp", "<CMD>ToggleFoldLevel4<CR>", {desc = "Toggle Fold Level4"})
keymap.set("n", "<Leader>tf[", "<CMD>ToggleFoldLevel5<CR>", {desc = "Toggle Fold Level5"})

--- set expandtab をトグル
keymap.set('n', '<Leader>te', '<CMD>set expandtab!<CR>', {desc = "Toggle EXPANDTAB"})
--- set list をトグル
keymap.set('n', '<Leader>tl', '<CMD>set list!<CR>', {desc = "Toggle LIST"})
--- set wrap をトグル
keymap.set('n', '<Leader>tw', '<CMD>set wrap!<CR>', {desc = "Toggle WRAP"})
--- カーソル位置強調表示のトグル
keymap.set('n', '<Leader>tc', '<CMD>setlocal cursorline! cursorcolumn!<CR>', {desc = "Toggle Cursor"})
--- スペルチェック
keymap.set('n', '<Leader>ts', '<CMD>set spell!<CR>', {desc = "Toggle Spell-Check"})
--- hlchunk用処理
keymap.set("n", "<Leader>th", require("hamu.plugins.hlchunk").toggle, { desc = "Toggle HLChunk" })
--- "Show Diagnostic"を表示
keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, { desc = "Show diagnostic message" })
