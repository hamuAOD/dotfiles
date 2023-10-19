-- set Leader key to space
vim.g.mapleader = " "
local NS = { noremap = true, silent = true }

local keymap = vim.keymap

-- 検索ハイライトをEscキー2回押しで消去
keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR><ESC>', {remap = true})

-- Escで日本語入力解除
-- vim.keymap.set('i', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>', {remap = true})
-- vim.keymap.set('n', '<ESC><ESC>', '<ESC>:set iminsert=0<CR>', {remap = true})

-- set expandtab をトグル
keymap.set('n', '<Leader>se', ':set expandtab!<CR>', {desc = "Toggle EXPANDTAB"}, NS)
-- set list をトグル
keymap.set('n', '<Leader>sl', ':set list!<CR>', {desc = "Toggle LIST"}, NS)
-- ノーマルモードでもエンターキーで改行を挿入
-- keymap.set('n', '<CR>', 'o<ESC>', {noremap = true})

-- カーソル位置強調表示のトグル
keymap.set('n', '<Leader>sc', ':<C-u>setlocal cursorline! cursorcolumn!<CR>', {desc = "Toggle Cursor"}, NS)

-- Auto Brackets
keymap.set('i', '(', '()<LEFT>', NS)
keymap.set('i', '"', '""<LEFT>', NS)
keymap.set('i', '\'', '\'\'<LEFT>', NS)
keymap.set('i', '[', '[]<LEFT>', NS)
keymap.set('i', '<', '<><LEFT>', NS)
keymap.set('i', '{', '{}<LEFT>', NS)

-- keymap.set('x', '<Leader>ae', '<Plug>(EasyAlign)', { desc = "vim-easy-align" }, NS)
-- keymap.set('n', '<Leader>ae', '<Plug>(EasyAlign)', { desc = "vim-easy-align" }, NS)
