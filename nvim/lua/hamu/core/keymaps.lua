-- set Leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap
local NS = { noremap = true, silent = true }

-- 検索ハイライトをEscキー2回押しで消去
keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR><ESC>', {remap = true})

-- Escで日本語入力解除
-- vim.keymap.set('i', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>', NS)
-- vim.keymap.set('n', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>', NS)

-- 画面分割
keymap.set('n', 'sh', '<CMD>split<CR><C-w>w', {desc = "Split Window Holizontal"}, NS)
keymap.set('n', 'sv', '<CMD>vsplit<CR><C-w>w', {desc = "Split Window Vertical"}, NS)
-- 画面移動
keymap.set('n', 'sn', '<C-w>w', {desc = "Next Window"}, NS)
keymap.set('n', 'sp', '<C-w><S-w>', {desc = "Previous Window"}, NS)

-- set expandtab をトグル
keymap.set('n', '<Leader>te', '<CMD>set expandtab!<CR>', {desc = "Toggle EXPANDTAB"}, NS)
-- set list をトグル
keymap.set('n', '<Leader>tl', '<CMD>set list!<CR>', {desc = "Toggle LIST"}, NS)
-- カーソル位置強調表示のトグル
keymap.set('n', '<Leader>tc', '<CMD><C-u>setlocal cursorline! cursorcolumn!<CR>', {desc = "Toggle Cursor"}, NS)

-- ノーマルモードでもエンターキーで改行を挿入
-- keymap.set('n', '<CR>', 'o<ESC>', {noremap = true})
