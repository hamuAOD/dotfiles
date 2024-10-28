-- set Leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap
local NS = { noremap = true, silent = true }

-- 検索ハイライトをEscキー2回押しで消去
keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR><ESC>', NS)

-- Change Keymaps
keymap.set('n', 'Y', 'y$', NS)        -- 行末までコピー
keymap.set('n', 'U', '<c-r>', NS)     -- リドゥ
keymap.set('n', 'M', '%', NS)         -- 括弧ジャンプ
keymap.set('x', 'M', '%', NS)         -- 括弧ジャンプ
keymap.set('n', '<CR>', 'o<ESC>', NS) -- 改行だけ挿入
keymap.set('n', 'gg', '0gg', NS)      -- Vim Styleの先頭へ移動

-- CUEファイル用検索
keymap.set('n', '<Leader>c', '/\\( \\l\\|[^\\x01-\\x7E]\\|TITLE\\)<CR>', {desc = "Search: Check CUE"}, NS)

-- インデント操作を連続でできるように
keymap.set('x', '<', '<gv', NS)
keymap.set('x', '>', '>gv', NS)
-- ウィンドウの幅調整
keymap.set('n', '<', '<C-w><<C-w>', NS)
keymap.set('n', '>', '<C-w>><C-w>', NS)
-- Current Directoryをファイルの場所にを変更
keymap.set('n', 'cd', '<CMD>cd %:h<CR>', {desc = "Change Current Directory"}, NS)
-- カーソル下のキーワードを置換
keymap.set('n', 'R', ':%s/\\V\\<<C-r><C-w>\\>//ge<Left><Left><Left>', {remap = true})
-- 選択したキーワードを置換
-- keymap.set('x', 'S', '"zy:%s/\\V<C-r><C-r>=escape\\(@z,'\\/\\\'\\)<CR>//gce<Left><Left><Left><Left>', {remap = true})
keymap.set('x', 'R', '"zy:%s/\\V<C-r><C-r>=escape(@z,\' /\\\')<CR>//ge<Left><Left><Left>', {remap = true})
-- ペースト結果のインデントを自動で揃える
keymap.set('n', 'p', ']p`]', NS)
keymap.set('n', 'P', ']P`]', NS)

-- Escで日本語入力解除
-- vim.keymap.set('i', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>', NS)
-- vim.keymap.set('n', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>', NS)

-- 画面分割
keymap.set('n', 'sh', '<CMD>split<CR><C-w>w', {desc = "Split Window Holizontal"}, NS)
keymap.set('n', 'sv', '<CMD>vsplit<CR><C-w>w', {desc = "Split Window Vertical"}, NS)
-- 画面移動
keymap.set('n', 'sn', '<C-w>w', {desc = "Next Window"}, NS)
keymap.set('n', 'sp', '<C-w><S-w>', {desc = "Previous Window"}, NS)
-- バッファ移動
-- keymap.set('n', '<C-p>', '<CMD>bprev<CR>', {desc = "Buffer Previous"}, NS)
-- keymap.set('n', '<C-n>', '<CMD>bnext<CR>', {desc = "Buffer Next"}, NS)
-- keymap.set('n', '<C-d>', '<CMD>bdelete<CR>', {desc = "Buffer Delete"}, NS)

-- set expandtab をトグル
keymap.set('n', '<Leader>te', '<CMD>set expandtab!<CR>', {desc = "Toggle EXPANDTAB"}, NS)
-- set list をトグル
keymap.set('n', '<Leader>tl', '<CMD>set list!<CR>', {desc = "Toggle LIST"}, NS)
-- カーソル位置強調表示のトグル
keymap.set('n', '<Leader>tc', '<CMD>setlocal cursorline! cursorcolumn!<CR>', {desc = "Toggle Cursor"}, NS)
-- スペルチェック
keymap.set('n', '<Leader>ts', '<CMD>set spell!<CR>', {desc = "Toggle Spell-Check"}, NS)

-- カーソルの直前の単語を大文字にする
vim.keymap.set("i", "<C-u>",
  function()
    local line = vim.fn.getline(".")
    local col = vim.fn.getpos(".")[3]
    local substring = line:sub(1, col - 1)
    local result = vim.fn.matchstr(substring, [[\v<(\k(<)@!)*$]])
    return "<C-w>" .. result:upper()
  end,
  {expr = true}
)
--- カーソルの直前の単語の先頭を大文字にする
vim.keymap.set('i', '<C-o>', '<ESC>bgUlgi', NS)

